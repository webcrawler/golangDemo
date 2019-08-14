/*
* lpack.c
* a Lua library for packing and unpacking binary data
* Luiz Henrique de Figueiredo <lhf@tecgraf.puc-rio.br>
* 29 Jun 2007 19:27:20
* This code is hereby placed in the public domain.
* with contributions from Ignacio Casta駉 <castanyo@yahoo.es> and
* Roberto Ierusalimschy <roberto@inf.puc-rio.br>.
*/
#ifdef __cplusplus
extern "C" {
#endif

#define	OP_ZSTRING	'z'		/* zero-terminated string */
#define	OP_BSTRING	'p'		/* string preceded by length byte */
#define	OP_WSTRING	'P'		/* string preceded by length word */
#define	OP_SSTRING	'a'		/* string preceded by length size_t */
#define	OP_STRING	'A'		/* string */
#define	OP_FLOAT	'f'		/* float */
#define	OP_DOUBLE	'd'		/* double */
#define	OP_NUMBER	'n'		/* Lua number */
#define	OP_CHAR		'c'		/* char */
#define	OP_BYTE		'b'		/* byte = unsigned char */
#define	OP_SHORT	'h'		/* short */
#define	OP_USHORT	'H'		/* unsigned short */
#define	OP_INT		'i'		/* int */
#define	OP_UINT		'I'		/* unsigned int */
#define	OP_LONG		'l'		/* long */
#define	OP_ULONG	'L'		/* unsigned long */
#define	OP_LITTLEENDIAN	'<'		/* little endian */
#define	OP_BIGENDIAN	'>'		/* big endian */
#define	OP_NATIVE	'='		/* native endian */

#include <ctype.h>
#include <string.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

	static void badcode(lua_State *L, int c)
	{
		char s[] = "bad code `?'";
		s[sizeof(s) - 3] = c;
		luaL_argerror(L, 1, s);
	}

	static int doendian(int c)
	{
		int x = 1;
		int e = *(char*)&x;
		if (c == OP_LITTLEENDIAN) return !e;
		if (c == OP_BIGENDIAN) return e;
		if (c == OP_NATIVE) return 0;
		return 0;
	}

	static void doswap(int swap, void *p, size_t n)
	{
		if (swap)
		{
			char *a = (char*)p;
			int i, j;
			for (i = 0, j = n - 1, n = n / 2; n--; i++, j--)
			{
				char t = a[i]; a[i] = a[j]; a[j] = t;
			}
		}
	}

#define UNPACKNUMBER(OP,T)		\
   case OP:				\
   {					\
    T a;				\
    int m=sizeof(a);			\
    if (i+m>len) goto done;		\
    memcpy(&a,s+i,m);			\
    i+=m;				\
    doswap(swap,&a,m);			\
    lua_pushnumber(L,(lua_Number)a);	\
    ++n;				\
    break;				\
   }

#define UNPACKSTRING(OP,T)		\
   case OP:				\
   {					\
    T l;				\
    int m=sizeof(l);			\
    if (i+m>len) goto done;		\
    memcpy(&l,s+i,m);			\
    doswap(swap,&l,m);			\
    if (i+m+l>len) goto done;		\
    i+=m;				\
    lua_pushlstring(L,s+i,l);		\
    i+=l;				\
    ++n;				\
    break;				\
   }

	static int l_unpack(lua_State *L) 		/** unpack(s,f,[init]) */
	{
		size_t len;
		const char *s = luaL_checklstring(L, 1, &len);
		const char *f = luaL_checkstring(L, 2);
		int i = luaL_optnumber(L, 3, 1) - 1;
		int n = 0;
		int swap = 0;
		lua_pushnil(L);
		while (*f)
		{
			int c = *f++;
			int N = 1;
			if (isdigit(*f))
			{
				N = 0;
				while (isdigit(*f)) N = 10 * N + (*f++) - '0';
				if (N == 0 && c == OP_STRING) { lua_pushliteral(L, ""); ++n; }
			}
			while (N--) switch (c)
			{
			case OP_LITTLEENDIAN:
			case OP_BIGENDIAN:
			case OP_NATIVE:
			{
				swap = doendian(c);
				N = 0;
				break;
			}
			case OP_STRING:
			{
				++N;
				if (i + N > len) goto done;
				lua_pushlstring(L, s + i, N);
				i += N;
				++n;
				N = 0;
				break;
			}
			case OP_ZSTRING:
			{
				size_t l;
				if (i >= len) goto done;
				l = strlen(s + i);
				lua_pushlstring(L, s + i, l);
				i += l + 1;
				++n;
				break;
			}
			UNPACKSTRING(OP_BSTRING, unsigned char)
				UNPACKSTRING(OP_WSTRING, unsigned short)
				UNPACKSTRING(OP_SSTRING, size_t)
				UNPACKNUMBER(OP_NUMBER, lua_Number)
				UNPACKNUMBER(OP_DOUBLE, double)
				UNPACKNUMBER(OP_FLOAT, float)
				UNPACKNUMBER(OP_CHAR, char)
				UNPACKNUMBER(OP_BYTE, unsigned char)
				UNPACKNUMBER(OP_SHORT, short)
				UNPACKNUMBER(OP_USHORT, unsigned short)
				UNPACKNUMBER(OP_INT, int)
				UNPACKNUMBER(OP_UINT, unsigned int)
				UNPACKNUMBER(OP_LONG, long)
				UNPACKNUMBER(OP_ULONG, unsigned long)
			case ' ': case ',':
				break;
			default:
				badcode(L, c);
				break;
			}
		}
	done:
		lua_pushnumber(L, i + 1);
		lua_replace(L, -n - 2);
		return n + 1;
	}

#define PACKNUMBER(OP,T)			\
   case OP:					\
   {						\
    T a=(T)luaL_checknumber(L,i++);		\
    doswap(swap,&a,sizeof(a));			\
    luaL_addlstring(&b,(const char*)&a,sizeof(a));	\
    break;					\
   }

#define PACKSTRING(OP,T)			\
   case OP:					\
   {						\
    size_t l;					\
    const char *a=luaL_checklstring(L,i++,&l);	\
    T ll=(T)l;					\
    doswap(swap,&ll,sizeof(ll));		\
    luaL_addlstring(&b,(const char*)&ll,sizeof(ll));	\
    luaL_addlstring(&b,a,l);			\
    break;					\
   }

	static int l_pack(lua_State *L) 		/** pack(f,...) */
	{
		int i = 2;
		const char *f = luaL_checkstring(L, 1);
		int swap = 0;
		luaL_Buffer b;
		luaL_buffinit(L, &b);
		while (*f)
		{
			int c = *f++;
			int N = 1;
			if (isdigit(*f))
			{
				N = 0;
				while (isdigit(*f)) N = 10 * N + (*f++) - '0';
			}
			while (N--) switch (c)
			{
			case OP_LITTLEENDIAN:
			case OP_BIGENDIAN:
			case OP_NATIVE:
			{
				swap = doendian(c);
				N = 0;
				break;
			}
			case OP_STRING:
			case OP_ZSTRING:
			{
				size_t l;
				const char *a = luaL_checklstring(L, i++, &l);
				luaL_addlstring(&b, a, l + (c == OP_ZSTRING));
				break;
			}
			PACKSTRING(OP_BSTRING, unsigned char)
				PACKSTRING(OP_WSTRING, unsigned short)
				PACKSTRING(OP_SSTRING, size_t)
				PACKNUMBER(OP_NUMBER, lua_Number)
				PACKNUMBER(OP_DOUBLE, double)
				PACKNUMBER(OP_FLOAT, float)
				PACKNUMBER(OP_CHAR, char)
				PACKNUMBER(OP_BYTE, unsigned char)
				PACKNUMBER(OP_SHORT, short)
				PACKNUMBER(OP_USHORT, unsigned short)
				PACKNUMBER(OP_INT, int)
				PACKNUMBER(OP_UINT, unsigned int)
				PACKNUMBER(OP_LONG, long)
				PACKNUMBER(OP_ULONG, unsigned long)
			case ' ': case ',':
				break;
			default:
				badcode(L, c);
				break;
			}
		}
		luaL_pushresult(&b);
		return 1;
	}

	// fjut : 交换_u32类型的字节顺序 （传32位的number）
	// https://blog.csdn.net/liuruiqun/article/details/45077135
	// https://blog.csdn.net/21aspnet/article/details/1534089
	// http://www.mit.edu/afs.new/sipb/project/merakidev/include/bits/byteswap.h
	// u32 bswap32(u32 x)
	// 见AppDelegate.cpp -> bswap32
	// 计算机电路先处理低位字节，效率比较高，因为计算都是从低位开始的。所以，计算机的内部处理都是小端字节序,发送数据前字节序转换变成大端模式（？？？todo）
	static int l_swab32(lua_State *L)
	{
		int x = (int)luaL_checkinteger(L, 1);
		int ret = ((x & 0x000000ff) << 24) | ((x & 0x0000ff00) << 8) | ((x & 0x00ff0000) >> 8) | ((x & 0xff000000) >> 24);
		lua_pushinteger(L, ret);
		return 1;
	}

	// fjut 传进的是大端字节序(p), 网络字节序 （传string）
	// http://www.ruanyifeng.com/blog/2016/11/byte-order.html
	// "只有读取的时候，才必须区分字节序，其他情况都不用考虑。"
	// 处理器读取外部数据的时候，必须知道数据的字节序，将其转成正确的值。然后，就正常使用这个值，完全不用再考虑字节序。
	// 即使是向外部设备写入数据，也不用考虑字节序，正常写入一个值即可。外部设备会自己处理字节序的问题。
	static int l_swab32_array(lua_State *L)
	{
		const char *f = (char*)luaL_checkstring(L, 1);
		unsigned char *p = (unsigned char*)f;
		int ret = ((p[0] << 24) | (p[1] << 16) | (p[2] << 8) | p[3]);
		lua_pushinteger(L, ret);
		return 1;
	}

	static int l_int64_to_string(lua_State *L)
	{
		const char *p = (char*)luaL_checkstring(L, 1);
		long long *val = (long long*)p;
		char buff[64];
		memset(buff, 0, sizeof(buff));
		sprintf(buff, "%lld", *val);
		lua_pushstring(L, buff);
		return 1;
	}

	static const luaL_reg R[] =
	{
		{"pack",	l_pack},
		{"unpack",	l_unpack},
		{ "swab32",			l_swab32 },
		{ "swab32_array",	l_swab32_array },
		{ "int64_to_string",	l_int64_to_string },
		{NULL,	NULL}
	};

	//#define USE_GLOBALS
	int luaopen_pack(lua_State *L)
	{
#ifdef USE_GLOBALS
		lua_register(L, "bpack", l_pack);
		lua_register(L, "bunpack", l_unpack);
		lua_register(L, "bswab32", l_swab32);
		lua_register(L, "bswab32_array", l_swab32_array);
		lua_register(L, "bint64_to_string", l_int64_to_string);
#else
		// 将上面几个接口插入到string的空间里面(string.pack/string.unpack ...)。
		luaL_openlib(L, LUA_STRLIBNAME, R, 0);
#endif
		return 0;
	}
#ifdef __cplusplus
}
#endif
