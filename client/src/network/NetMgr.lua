
NetMgr = {}

local bCrypto = false
local bConnect = false;
-- ���������
local MaxHeartBeatTime = 40
local MaxRetryTimes = 2
local curRetryTimes = 0
-- ����ҵ��ɹ�
local tbCallback = {}
local readCount = 1
local const_frame_rate = 1/60

-- socket�Ƿ�������
NetMgr.isConnected = function()
	return bConnect
end

-- socket recv ��⵽���ӶϿ����������� (���ɿ�)
NetMgr.onSocketRecvCloseAndReCon = function(callback)
	NetMgr.close()
    NetMgr.retryConnect()
end

NetMgr.onSocketRecvCloseAndReConExt = function(status)
    --NetMgr.close()
    bConnect = false
    NetMgr.retryConnect()
    if (DEBUG ~= 0) then 
        UI.MsgFly.show("net close status= "..status.." and retryConnect !")
    end
end

-- ����
NetMgr.connect = function()
	NetMgr.close()
    if not NetMgr.onGame then
        return false
    end
    -- timeout 3s��30û��
	bConnect = NetSocket_connect(GAME_SER_HOST, GAME_SER_PORT, crypto, 3, 30, NetMgr.onSocketRecvCloseAndReConExt)
	return bConnect
end

-- �ر�
NetMgr.close = function()
	NetSocket_close()
    bConnect = false
end

-- ������Ϣ
--local function sendPackage(msgStruct)
--    if NetMgr.isConnected() then
--        return NetSocket_send(msgStruct)
--    end
--    -- connect
--    if not NetMgr.connect() then
--        MsgEvent.sendEvent(EVENT_TAG.net_error, "(2)")
--        return false
--    else
--        return NetSocket_send(msgStruct)
--    end
--end

-- ������Ϣ
local function sendPackage(msgStruct)
    if NetMgr.isConnected() then
        return NetSocket_send(msgStruct)
    else
        return false
    end
end

-- ���������� ��������
NetMgr.waitForSendPackage = function(msgStruct, msgBuilder, msgHandler, obj, bSyn)
    NetMgr.sendSyn(msgStruct, msgBuilder, msgHandler, obj, bSyn)
end

-- ������Ϣ 
-- bSyn �Ƿ�ȴ���Ϣ����,Ĭ�Ϸ�
-- NetMgr.sendSyn(req_role_login, notify_login_result, self.loginGameRecv, self, false)
NetMgr.sendSyn = function(msgStruct, msgBuilder, msgHandler, obj, bSyn, tipsStr)
    local bSuccess = sendPackage(msgStruct)
    -- ����ʧ�ܣ����������·���
    if not bSuccess then
        --NetMgr.addNetConnectCallback(NetMgr.waitForSendPackage, msgStruct, msgBuilder, msgHandler, obj, bSyn)
        NetMgr.onSocketRecvCloseAndReCon()
        return
    end
    if bSuccess and msgBuilder ~= nil then
        local id = msgBuilder().getMsgID()
        NetEvent.regEvent(id, msgBuilder, msgHandler, obj)
        bSyn = bSyn or false
        if bSyn then LoadingUIMgr.show(id, false, tipsStr) end
    end
end

-- �������ݶ�ȡ
local function netDataRecv(dt)
    if not NetMgr.isConnected() then return end
    if not GameMgr.isInFishGame() then
        readCount = 1
    else
        readCount = math.ceil(dt/const_frame_rate) + 1
    end
    --cclog("const_frame_rate/dt: "..dt/const_frame_rate)
    --cclog("readCount: "..readCount)

    -- test code
--    if FishDebug and GameMgr.gameMenu ~= nil then
--        local label = GameMgr.gameMenu:getNode("Text_fish")
--        label:getParent():setVisible(true)
--        label:setString(""..readCount)
--    end
    -- test end

    -- fjut : 2018.05.01
--    for k = 1, readCount do
--        local tb = NetSocket_update()
--        if tb then
--            LoadingUIMgr.close(tb.msgId)
--            NetEvent.sendEvent(tb.msgId, tb.data)
--        end
--    end
    -- ������ʱ����Ϊ0
    NetMgr.heart_beat_time = 0
end

-- ����ҵ�񷵻�
NetMgr.retryConnectRecv = function(data)
    -- ����ʧ�ܣ��˳���Ϸ
    if data.result ~= common_result["common_success"] then
        MsgEvent.sendEvent(EVENT_TAG.net_error, "(4)") return
    end
    cclog("reconnect success !")
    MsgEvent.sendEvent(EVENT_TAG.reconnect_success)
    -- �����������µĴ�С�汾��
    CheckNewVersion.checkNewVersion()
end

-- �����ɹ�����������ҵ��
local function retryConnectForReq()
--    local tb = req_game_reconnect()
--    tb.version = get_proto_version()
--    tb.user_id = UserData.getUserData().user_id
--    tb.token = UserData.getUserData().token
--    NetMgr.sendSyn(tb, notify_reconnect_result, NetMgr.retryConnectRecv)

    local userData = UserData.getUserData()
    local tb_req = req_role_login()
    tb_req.uid = ""..userData.user_id
    tb_req.server_id = 2
    tb_req.token = userData.token
    tb_req.type = connect_type["re_connect"]
    tb_req.version = get_proto_version()
    tb_req.device_id = GetDeviceOnleyID()
    NetMgr.sendSyn(tb_req, notify_login_result, NetMgr.retryConnectRecv, nil, true)
end

-- ����
local function retryConnect()
    curRetryTimes = curRetryTimes + 1
    if (not NetMgr.connect()) then
        cclog("retry times = "..curRetryTimes)
        if curRetryTimes < MaxRetryTimes then
            UIMgr.getRunningScene():runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.CallFunc:create(retryConnect)))
        else
            MsgEvent.sendEvent(EVENT_TAG.net_error, "(3)")
            LoadingUIMgr.close(LoadingUIMgr.retryConnect_tag)
        end
    else
        LoadingUIMgr.close(LoadingUIMgr.retryConnect_tag)
        -- �ڵ�¼���治����������¼ҵ��
        if ( g_GameMgr:isInRoom() or (UIMgr.getCurScene() ~= nil and UIMgr.getCurScene().name ~= "SceneLogin") ) then
            retryConnectForReq()
        end
    end
end

-- ִ������
NetMgr.retryConnect = function()
    -- �Ѿ�����
    if NetMgr.isConnected() then 
        return 
    end
    -- ��δ��¼web��(�л��˺ŵ����)
    local tb = UserData.getUserData()
    if tb.account == nil or (string.len(tb.account) == 0) then
        return 
    end
    -- ��ûЭ����
    if not Controller.bCheckProVer then
        return 
    end
    -- ����������״̬
    local bFind = LoadingUIMgr.findId(LoadingUIMgr.retryConnect_tag)
    if bFind then
        return 
    end
    curRetryTimes = 0
    LoadingUIMgr.show(LoadingUIMgr.retryConnect_tag, true)
    -- �ӳ�
	local function retryConnectCall()
        retryConnect()
    end	
    UIMgr.getRunningScene():runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(retryConnectCall)))
end

-- ��̨������֤socket����״̬recv
NetMgr.checkConnectStatusRecv = function(data)
    -- connect status ok
end

-- ��̨������֤socket����״̬
NetMgr.checkConnectStatus = function()
    -- ������ʱ����Ϊ0
    NetMgr.heart_beat_time = 0
    --
    local tb_req = req_check_time()
    NetMgr.sendSyn(tb_req, notify_check_time, NetMgr.checkConnectStatusRecv, nil, true)
end

-- ÿһ��ִ��
local function everySecondCall()
    -- ��û����
    if not NetMgr.isConnected() then
        NetMgr.heart_beat_time = 0
        return
    end
    NetMgr.heart_beat_time = NetMgr.heart_beat_time + 1
    --cclog("offTime = "..NetMgr.heart_beat_time)
    -- ��������
    if (NetMgr.heart_beat_time > MaxHeartBeatTime) then
        cclog("heart_beat_time over !")
        --NetMgr.heart_beat_time = 0
        NetMgr.close()
        NetMgr.retryConnect()
    end
end

-- ����ҵ��ɹ�
NetMgr.addNetConnectCallback = function(callback, ...)
    local tb = {callback = callback, parms = {...}}
    table.insert(tbCallback, tb)
end

-- ����ҵ��ɹ�
NetMgr.onReconGameSuccess = function()
	local k = 1
	while (k <= #(tbCallback)) do
		if type(tbCallback[k].callback) == "function" then
            tbCallback[k].callback(unpack(tbCallback[k].parms))
            table.remove(tbCallback, k)
		else
			k = k + 1
		end
	end
    tbCallback = {}
end 

NetMgr.instance = function()
    NetMgr.heart_beat_time = 0
    MaxHeartBeatTime = cc.UserDefault:getInstance():getIntegerForKey("max_heart_beat_time", MaxHeartBeatTime);
    MsgEvent.regEvent(EVENT_TAG.CALLED_EVERY_FRAME, netDataRecv)
    MsgEvent.regEvent(EVENT_TAG.CALLED_EVERY_SECOND, everySecondCall)
    -- ����ҵ��ɹ��ص�
    MsgEvent.regEvent(EVENT_TAG.reconnect_success, NetMgr.onReconGameSuccess)
    NetMgr.onGame = true
end

NetMgr.freeInstance = function()
    MsgEvent.unRegEvent(EVENT_TAG.CALLED_EVERY_FRAME, netDataRecv)
    MsgEvent.unRegEvent(EVENT_TAG.CALLED_EVERY_SECOND, everySecondCall)
    -- ����ҵ��ɹ��ص�
    MsgEvent.unRegEvent(EVENT_TAG.reconnect_success, NetMgr.onReconGameSuccess)
    tbCallback = {}
    NetMgr.onGame = false
end



