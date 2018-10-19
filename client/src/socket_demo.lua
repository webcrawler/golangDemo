
SocketDemo = {}
local socket = require("socket")

local tcp = nil
local timeout = 3

local HEAD_SIZE = 4					
local mReceiveLen = HEAD_SIZE	
local mGetHead = true					
local mHasReceived = ""				
local mHasReceivedLen = 0

local STATUS_CLOSED = "closed"
local STATUS_NOT_CONNECTED = "Socket is not connected"
local STATUS_ALREADY_CONNECTED = "already connected"
local STATUS_ALREADY_IN_PROGRESS = "Operation already in progress"
local STATUS_TIMEOUT = "timeout"

local SOCKET_TICK_TIME = 0.1 			-- check socket data interval
local SOCKET_RECONNECT_TIME = 5			-- socket reconnect try interval
local SOCKET_CONNECT_FAIL_TIMEOUT = 3	-- socket failure timeout		

local localScheduler = cc.Director:getInstance():getScheduler()
local connectTimeTickScheduler = nil
local tickScheduler = nil
local isConnected = false
local waitConnectTime = 0	

local function getIsIpv6(host)
    local addrInf, err = socket.dns.getaddrinfo(host)
    addrInf = addrInf or {}
    for k, v in pairs(addrInf) do
        if v.family == "inet6" then
            return true
        end
    end
    return false
end

local function unscheduleScriptEntry(scheduler)
    if scheduler ~= nil then
        localScheduler:unscheduleScriptEntry(scheduler)
        scheduler = nil
    end
end

local function close()
    tcp:close()
    unscheduleScriptEntry(connectTimeTickScheduler)
    unscheduleScriptEntry(tickScheduler) 
end

local function connectFailure()
    waitConnectTime = 0
	close()
	--_reconnect
    --NetMgr.connect()
end

local function onConnected()
    isConnected = true
    unscheduleScriptEntry(connectTimeTickScheduler)

	local tick = function()
		--while true do
			local body, status, partial = tcp:receive(mReceiveLen) --(mReceiveLen)
			print("body:", body, "status:", status, "partial:", partial)
    	    if status == STATUS_CLOSED or status == STATUS_NOT_CONNECTED then
		    	close()
		    	if isConnected then
		    		--self:_onDisconnect()
		    	else
		    		connectFailure()
		    	end
		   		return
            elseif "timeout" == status then
                --parseData(partial)
                return
            else
                if body == nil or body == "" then
                    local x = 0
                    print("nil-----")
                end

		        if 	(body and string.len(body) == 0) or (partial and string.len(partial) == 0) then 
                    return 
                end
			    if body and partial then 
                    body = body .. partial 
                end
                --parseData(body)
	    	end
		--end
	end
	tickScheduler = localScheduler:scheduleScriptFunc(tick, 0.016, false) -- 0.016
end

SocketDemo.connect = function(host, port)
    -- check v6 
    local isIpv6 = getIsIpv6(host)
    if isIpv6 then
        tcp, err = socket.tcp6()
    else
        tcp, err = socket.tcp()
    end
	tcp:settimeout(0)

    local function _connect()
		local succ, status = tcp:connect(host, port)
	    print("socket connect:", succ, status)
        -- the connection is failure if socket isn't connected after SOCKET_CONNECT_FAIL_TIMEOUT seconds
		local bConnect = (succ == 1 or status == STATUS_ALREADY_CONNECTED)
        if bConnect then
            onConnected()

            -- test send data
	        local head = string.pack(">i", 6)
	        local nSend = tcp:send(head)
        end
        return bConnect
    end
    -- test
    --connectTimeTickScheduler = localScheduler:scheduleScriptFunc(_connect, SOCKET_TICK_TIME, false) 

	if not _connect() then
		local connectTimeTick = function ()
			if isConnected then return end
			waitConnectTime = waitConnectTime + SOCKET_TICK_TIME
			if waitConnectTime >= SOCKET_CONNECT_FAIL_TIMEOUT then
				connectFailure()
			end
			_connect()
		end
        connectTimeTickScheduler = localScheduler:scheduleScriptFunc(connectTimeTick, SOCKET_TICK_TIME, false) 
	end

    return true
end

SocketDemo.send = function(msgStruct)
	-- 数据包字节流
--	local byteArray = ByteArray()
--	byteArray = msgStruct.build(byteArray)
--	-- 包体(发包次数+数据包字节流)
--	local count = calcPacketCount()
--	local body = string.pack("b", count)..byteArray.getBytes()
--	-- 加密
--	--body = encodePacketCrypto(body)
--	-- 包头(大小端转换后的包体长度)
--	local bodyLength = string.len(body)	 -- 包体长度
--    local xxx = string.swab32(bodyLength)	
--    --print(type(xxx))		
--    -- http://bbs.chinaunix.net/thread-563281-1-1.html  ？？？？
--    --short 或者 long的数据在进行通信的时候最好养成：
--    --1、发送的时候使用：htons（l）
--    --2、接受的时候使用：ntohs（l）
--    --而不要理会两边的通信是否需要这么做~~
--    --当然了一般我都不用int型的数据通信，从来都是字符串通信，发送方利用sprintf组织，接收方利用atoi进行转换	
--    -- https://blog.csdn.net/erlib/article/details/46349501
--    -- Erlang packet包头是以大端字节序（big-endian）表示。如果erlang与其他语言，比如C++，就要注意字节序问题了。
--    -- 如果机器的字节序是小端字节序（little-endian），就要做转换。 
--    -- fjut: （转大端）或者 	local head = string.pack(">i", bodyLength) 
--	local head = string.pack("i", string.swab32(bodyLength))	-- 包头四个字节,这里要用"i"
--	-- 发送
--    -- fjut: 包头长度固定，包体可变长
--	local nSend = tcp:send(head..body)
--	local msgId = msgStruct.getMsgID()
--    if PRINT_NETWORK_LOG then
--	    --cclog("---------- send ["..NetSocket_getMsgName(msgId)..", "..msgId.."], count = "..count)
--        print(msgStruct)
--    end
--    if (nSend == nil or nSend <= 0) then
--        print("----------send fail----------")
--    end
--    return (nSend ~= nil and nSend > 0)
end
