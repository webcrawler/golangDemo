
SocketExt = {}

local socket = require("socket")

local SOCKET_TICK_TIME = 0.1 			-- check socket data interval
local SOCKET_CONNECT_FAIL_TIMEOUT = 3	-- socket failure timeout	
local SOCKET_RECV_TIME	= 0

local STATUS_CLOSED = "closed"
local STATUS_NOT_CONNECTED = "Socket is not connected"
local STATUS_ALREADY_CONNECTED = "already connected"
local STATUS_ALREADY_IN_PROGRESS = "Operation already in progress"
local STATUS_TIMEOUT = "timeout"

local localScheduler = cc.Director:getInstance():getScheduler()

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

SocketExt.connect = function(host, port, callback)
    SocketExt.connectReset()

    SocketExt.callback = callback
    -- check v6 
    local isIpv6 = getIsIpv6(host)
    if isIpv6 == true then
        SocketExt.tcp, err = socket.tcp6()
    else
        SocketExt.tcp, err = socket.tcp()
    end
	SocketExt.tcp:settimeout(0)

    local function connect()
		local succ, status = SocketExt.tcp:connect(host, port)
	    --print("socket connect:", succ, status)
        -- the connection is failure if socket isn't connected after SOCKET_CONNECT_FAIL_TIMEOUT seconds
		local bConnect = (succ == 1 or status == STATUS_ALREADY_CONNECTED)
        if bConnect == true then
            SocketExt.freeConnectSche()
            SocketExt.onConnected()
        end
        if bConnect == true and type(SocketExt.callback) == "function" then
            SocketExt.callback(0)
        end
    end

    local waitConnectTime = 0
	local connectTimeTick = function ()
		if SocketExt.isConnected == true then return end
		waitConnectTime = waitConnectTime + SOCKET_TICK_TIME
		if waitConnectTime >= SOCKET_CONNECT_FAIL_TIMEOUT then
			SocketExt.connectReset()
            if type(SocketExt.callback) == "function" then SocketExt.callback(1) end
		end
		connect()
	end
    SocketExt.connectTimeTickScheduler = localScheduler:scheduleScriptFunc(connectTimeTick, SOCKET_TICK_TIME, false) 
end

SocketExt.onConnected = function()
    SocketExt.isConnected = true
    
    SocketExt.freeRecvSche()
	SocketExt.recvTickScheduler = localScheduler:scheduleScriptFunc(SocketExt.recv, SOCKET_RECV_TIME, false)
end

local HEAD_SIZE = 4					
local mReceiveLen = HEAD_SIZE	
local mGetHead = true					
local mHasReceived = ""				
local mHasReceivedLen = 0

local testContent = ""
SocketExt.recv = function()
	local body, status, partial = SocketExt.tcp:receive(3) --(mReceiveLen)
	print("body:", body, "status:", status, "partial:", partial)
    if status == STATUS_CLOSED or status == STATUS_NOT_CONNECTED then
		SocketExt.connectReset()
        if type(SocketExt.callback) == "function" then SocketExt.callback(2) end
		return
    else
		if body then 
            testContent = testContent .. body 
        end
		if partial then 
            testContent = testContent .. partial 
        end
        print("content:"..testContent)
	end
end

-- test
SocketExt.send = function()
    local val = 0
    local jjxx = nil
    local function send()
	    local head = string.pack(">i", val)
	    local nSend = SocketExt.tcp:send(head)

        if (nSend == nil or nSend <= 0) then
            print("----------send fail----------")
        end
        val = val + 1
        localScheduler:unscheduleScriptEntry(jjxx)
    end

    jjxx = localScheduler:scheduleScriptFunc(send, 1, false)
end

SocketExt.connectReset = function()
    SocketExt.isConnected = false

    if SocketExt.tcp ~= nil then
        SocketExt.tcp:close()
        SocketExt.tcp = nil
    end

    SocketExt.freeConnectSche()
    SocketExt.freeRecvSche()
end

SocketExt.freeConnectSche = function()
    if SocketExt.connectTimeTickScheduler ~= nil then
        localScheduler:unscheduleScriptEntry(SocketExt.connectTimeTickScheduler)
        SocketExt.connectTimeTickScheduler = nil
    end
end

SocketExt.freeRecvSche = function()
    if SocketExt.recvTickScheduler ~= nil then
        localScheduler:unscheduleScriptEntry(SocketExt.recvTickScheduler)
        SocketExt.recvTickScheduler = nil
    end
end