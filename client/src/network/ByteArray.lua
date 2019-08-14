
-- fjut 2018.04.30

BA_ENDIAN_BIG = "ENDIAN_BIG"
BA_ENDIAN_LITTLE = "ENDIAN_LITTLE"

function ByteArray(endian)
    -- 进制
	local mRadix = {[8]="%03o", [10]="%03u", [16]="%02X"}		
	local mEndian = endian or ""
    -- 二进制字节流								
	local mBuf = {}	
    -- 读写位置											
	local mPos = 1												

	-- 验证读写位置
	local function checkAvailable()
		assert(#mBuf >= mPos, string.format("End of file was encountered. pos: %d, length: %d.", mPos, #mBuf))
	end

	-- 获取字符码
    --<: 设为小端编码
    -->: 设为大端编码
    --=: 大小端遵循本地设置
    --http://cloudwu.github.io/lua53doc/manual.html#6.4.2
    -- A string describing how the values x1, x2, ... are to be interpreted and formatted
    -- http://www.luteus.biz/Download/LoriotPro_Doc/LUA/LUA_For_Windows/lpack/
	local function getLetterCode(fmt)
		fmt = fmt or ""
		if BA_ENDIAN_LITTLE == mEndian then
			return "<"..fmt
		elseif BA_ENDIAN_BIG == mEndian then
			return ">"..fmt
		else
			return "="..fmt
		end
	end

	-- 读单个字节
	local function readRawByte()
		checkAvailable()
		local rawByte = mBuf[mPos]
		mPos = mPos + 1
		return rawByte
	end

	-- 读字节流
	local function readBuf(length)
		checkAvailable()
        -- table.concat (list [, sep [, i [, j]]])
        -- 提供一个列表，其所有元素都是字符串或数字，返回字符串 list[i]..sep..list[i+1] ··· sep..list[j]。 
        -- sep 的默认值是空串， i 的默认值是 1 ， j 的默认值是 #list 。 如果 i 比 j 大，返回空串。
		local buf = table.concat(mBuf, "", mPos, mPos + length - 1)
		mPos = mPos + length
		return buf
	end

	-- 读字符串
	local function read_string_bytes(length)
		if 0 == length then
			return ""
		end
        -- getLetterCode("A"..length) 可以改为 getLetterCode("A") ？ todo（测试可以）
		local tmp, value = string.unpack(readBuf(length), getLetterCode("A"..length))
		return value
	end

	-- 写单个字节
	local function writeRawByte(rawByte)
		if mPos > #mBuf + 1 then
            -- fix: mPos - 1 改为mPos ?
			for i = #mBuf + 1, mPos - 1 do
                -- string.char将ASCII码转化为相对应字符,在功能上与函数string.byte()是互逆的。
                -- ASCII码0对应字符是NUL
				mBuf[i] = string.char(0)
			end
		end
		mBuf[mPos] = rawByte
		mPos = mPos + 1
	end

	-- 写字节流
	local function writeBuf(buf)
		for i = 1, #buf do
			--writeRawByte(string.sub(buf, i, i))
            writeRawByte(buf:sub(i, i))
		end
	end

	-- 写字符串  todo ?
	local function write_string_bytes(value)
        -- fjut getLetterCode("A", value) （"=A"）(A : string)把value打包成binary data且采用本地大小端设置
		local buf = string.pack(getLetterCode("A"), value)
		writeBuf(buf)
	end


	local ba = {}

	-- 设置大小端
	ba.setEndian = function(endian)
		mEndian = endian or ""
	end

	-- 设置字节流
	ba.setBytes = function(buf)
		if #mBuf > 0 then
			return
		end
		writeBuf(buf)
        -- 这里必须重置读写位置为1, 方能保证接下去的读操作正确
		mPos = 1		
	end

	-- 获取字节流
	ba.getBytes = function()
		local bytes = {}
		for i = 1, #mBuf do
            -- string.byte 转换字符为ASCII https://www.jianshu.com/p/1b8c55327b0a
			bytes[#bytes+1] = string.byte(mBuf[i]) 
		end
        -- b:byte (unsigned char) 
		local packRes = string.pack(getLetterCode("b"..#bytes), unpack(bytes))
		return packRes
	end

	-- 获取字节流长度
	ba.getLength = function()
		return #mBuf
	end

	-- 字节流转为字符串,radix-8,10,16
	ba.toString = function(radix, separator)
		radix = radix or 16 
		radix = mRadix[radix] or "%02X"
		separator = separator or " "
		local bytes = {}
		for i = 1, #mBuf do
			bytes[i] = string.format(radix..separator, string.byte(mBuf[i]))
		end
		return table.concat(bytes)
	end

	-- 读16位整型
	ba.read_int16 = function()
		local tmp, value = string.unpack(readBuf(2), getLetterCode("h"))
		return value
	end

	-- 读16位无符号整型
	ba.read_uint16 = function()
		local tmp, value = string.unpack(readBuf(2), getLetterCode("H"))
		return value
	end

	-- 读32位整型
	ba.read_int = function()
		local tmp, value = string.unpack(readBuf(4), getLetterCode("i"))
		return value
	end

	-- 读32位无符号整型
	ba.read_uint = function()
		local tmp, value = string.unpack(readBuf(4), getLetterCode("I"))
		return value
	end

	-- 读长整型  todo 4字节？？
	ba.read_long = function()
		local tmp, value = string.unpack(readBuf(4), getLetterCode("l"))
		return value
	end

   -- 读无符号长整型
	ba.read_ulong = function()
		local tmp, value = string.unpack(readBuf(4), getLetterCode("L"))
		return value
	end

	-- 读64位整型
	ba.read_int64 = function()
		-- local tmp, value = string.unpack(readBuf(8), getLetterCode("m"))
		-- return value

        -- fjut :  8bytes 长的 string 来表示一个 int64
        -- https://blog.codingnow.com/2012/04/lua_int64.html
		return read_string_bytes(8)
	end

	-- 读64位无符号整型
	ba.read_uint64 = function()
		-- local tmp, value = string.unpack(readBuf(8), getLetterCode("M"))
		-- return value
		return read_string_bytes(8)
	end

	-- 读单精度浮点型
	ba.read_float = function()
		local tmp, value = string.unpack(readBuf(4), getLetterCode("f"))
		return value
	end

	-- 读双精度浮点型
	ba.read_double = function()
		local tmp, value = string.unpack(readBuf(8), getLetterCode("d"))
		return value
	end

	-- 读布尔型
	ba.read_bool = function()
		return 1 == read_char()
	end

	-- 读字符型
	ba.read_char = function()
		local tmp, value = string.unpack(readRawByte(), "c")
		return value
	end

	-- 读单字节
	ba.read_uchar = function()
		-- 方法1
		-- return string.byte(readRawByte())
		-- 方法2
		local tmp, value = string.unpack(readRawByte(), "b")
		return value
	end

	-- 读字符串
	ba.read_string = function()
        -- fjut:先读取字符串长度 （读16位(8字节)无符号整型）
		local length = ba.read_uint16()
		return read_string_bytes(length)
	end


	-- 写16位整型
	ba.write_int16 = function(value)
		local buf = string.pack(getLetterCode("h"), value)
		writeBuf(buf)
	end

	-- 写16位无符号整型
	ba.write_uint16 = function(value)
		local buf = string.pack(getLetterCode("H"), value)
		writeBuf(buf)
	end

	-- 写32位整型
	ba.write_int = function(value)
		local buf = string.pack(getLetterCode("i"), value)
		writeBuf(buf)
	end

	-- 写32位无符号整型
	ba.write_uint = function(value)
		local buf = string.pack(getLetterCode("I"), value)
		writeBuf(buf)
	end

	-- 写长整型
	ba.write_long = function(value)
		local buf = string.pack(getLetterCode("l"), value)
		writeBuf(buf)
	end

	-- 写无符号长整型
	ba.write_ulong = function(value)
		local buf = string.pack(getLetterCode("L"), value)
		writeBuf(buf)
	end

	-- 写64位整型
	ba.write_int64 = function(value)
		-- local buf = string.pack(getLetterCode("m"), value)
		-- writeBuf(buf)
		local buf = string.pack(getLetterCode("A"), value)
		writeBuf(buf)
	end

	-- 写64位无符号整型
	ba.write_uint64 = function(value)
		-- local buf = string.pack(getLetterCode("M"), value)
		-- writeBuf(buf)
		local buf = string.pack(getLetterCode("A"), value)
		writeBuf(buf)
	end

	-- 写单精度浮点型
	ba.write_float = function(value)
		local buf = string.pack(getLetterCode("f"), value)
		writeBuf(buf)
	end

	-- 写双精度浮点型
	ba.write_double = function(value)
		local buf = string.pack(getLetterCode("d"), value)
		writeBuf(buf)
	end

	-- 写布尔型
	ba.write_bool = function(value)
		if value then 
			ba.write_char(1)
		else
			ba.write_char(0)
		end
	end

	-- 写字符型
	ba.write_char = function(value)
		writeRawByte(string.pack("c", value))
	end

	-- 写单字节
	ba.write_uchar = function(value)
		-- 方法1
		-- writeRawByte(string.char(value))
		-- 方法2
		writeRawByte(string.pack("b", value))
	end

	-- 写字符串
	ba.write_string = function(value)
		local buf = string.pack(getLetterCode("A"), value)
        -- fjut:先写入字符串长度（16位无符号整型）
		ba.write_uint16(#buf)
		writeBuf(buf)
	end

	return ba
end
