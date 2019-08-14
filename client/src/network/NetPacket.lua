
function req_check_version ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_check_version"]
    end
    tb.version = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.version)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.version = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_check_version"])
        return tb.encode(byteArray)
    end

    return tb

end

function stime ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_stime"]
    end
    tb.year = 0
    tb.month = 0
    tb.day = 0
    tb.hour = 0
    tb.minute = 0
    tb.second = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.year)
    	byteArray.write_int(tb.month)
    	byteArray.write_int(tb.day)
    	byteArray.write_int(tb.hour)
    	byteArray.write_int(tb.minute)
    	byteArray.write_int(tb.second)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.year = byteArray.read_int();
        tb.month = byteArray.read_int();
        tb.day = byteArray.read_int();
        tb.hour = byteArray.read_int();
        tb.minute = byteArray.read_int();
        tb.second = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_stime"])
        return tb.encode(byteArray)
    end

    return tb

end

function common_good ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_common_good"]
    end
    tb.type = 0
    tb.id = 0
    tb.num = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
    	byteArray.write_int(tb.id)
    	byteArray.write_int(tb.num)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        tb.id = byteArray.read_int();
        tb.num = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_common_good"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_role_login ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_role_login"]
    end
    tb.uid = ""
    tb.server_id = 0
    tb.token = ""
    tb.type = 0
    tb.version = 0
    tb.device_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.uid)
    	byteArray.write_int(tb.server_id)
    	byteArray.write_string(tb.token)
    	byteArray.write_int(tb.type)
    	byteArray.write_int(tb.version)
    	byteArray.write_string(tb.device_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.uid = byteArray.read_string();
        tb.server_id = byteArray.read_int();
        tb.token = byteArray.read_string();
        tb.type = byteArray.read_int();
        tb.version = byteArray.read_int();
        tb.device_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_role_login"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_login_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_login_result"]
    end
    tb.id = 0
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.id)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_uint64();
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_login_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_check_version ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_check_version"]
    end
    tb.result = 0
    tb.curtime = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        tb.curtime.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
        tb.curtime = stime();
        tb.curtime.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_check_version"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_login_check ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_login_check"]
    end
    tb.uid = ""
    tb.token = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.uid)
    	byteArray.write_string(tb.token)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.uid = byteArray.read_string();
        tb.token = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_login_check"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_login_check_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_login_check_result"]
    end
    tb.result = 0
    tb.error_code = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
    	byteArray.write_int(tb.error_code)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
        tb.error_code = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_login_check_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_loading_end ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_loading_end"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_loading_end"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_sys_msg ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_sys_msg"]
    end
    tb.code = 0
    tb.type = 0
    tb.Params = {}
    tb.priority = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.code)
    	byteArray.write_int(tb.type)
        byteArray.write_uint16(#(tb.Params))
        for k, v in pairs (tb.Params) do
            byteArray.write_string(v)
        end
    	byteArray.write_int(tb.priority)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.code = byteArray.read_int();
        tb.type = byteArray.read_int();
        local countOfParams = byteArray.read_uint16()
        tb.Params = {}
        for i = 1, countOfParams do
             table.insert(tb.Params, byteArray.read_string())
        end
        tb.priority = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_sys_msg"])
        return tb.encode(byteArray)
    end

    return tb

end

function pack_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_pack_item"]
    end
    tb.item_id = 0
    tb.temp_id = 0
    tb.item_type = 0
    tb.amount = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.item_id)
    	byteArray.write_int(tb.temp_id)
    	byteArray.write_int(tb.item_type)
    	byteArray.write_int(tb.amount)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.item_id = byteArray.read_uint64();
        tb.temp_id = byteArray.read_int();
        tb.item_type = byteArray.read_int();
        tb.amount = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_pack_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_recharge ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_recharge"]
    end
    tb.order_id = 0
    tb.user_id = 0
    tb.role_id = 0
    tb.charge_from = 0
    tb.recharge_id = 0
    tb.channel_id = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.order_id)
    	byteArray.write_uint64(tb.user_id)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.charge_from)
    	byteArray.write_int(tb.recharge_id)
    	byteArray.write_int(tb.channel_id)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.order_id = byteArray.read_int();
        tb.user_id = byteArray.read_uint64();
        tb.role_id = byteArray.read_uint64();
        tb.charge_from = byteArray.read_int();
        tb.recharge_id = byteArray.read_int();
        tb.channel_id = byteArray.read_int();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_recharge"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_buy_mooncard ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_buy_mooncard"]
    end
    tb.type = 0
    tb.recharge_id = 0
    tb.get_emoney = 0
    tb.give_emoney = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
    	byteArray.write_int(tb.recharge_id)
    	byteArray.write_int(tb.get_emoney)
    	byteArray.write_int(tb.give_emoney)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        tb.recharge_id = byteArray.read_int();
        tb.get_emoney = byteArray.read_int();
        tb.give_emoney = byteArray.read_int();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_buy_mooncard"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_convert_cdkey ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_convert_cdkey"]
    end
    tb.award_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.award_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.award_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_convert_cdkey"])
        return tb.encode(byteArray)
    end

    return tb

end

function award_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_award_item"]
    end
    tb.temp_id = 0
    tb.amount = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.temp_id)
    	byteArray.write_int(tb.amount)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.temp_id = byteArray.read_int();
        tb.amount = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_award_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function award_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_award_info"]
    end
    tb.award_id = 0
    tb.award_value = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.award_id)
    	byteArray.write_int64(tb.award_value)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.award_id = byteArray.read_int();
        tb.award_value = byteArray.read_int64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_award_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_heartbeat ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_heartbeat"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_heartbeat"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_check_time ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_check_time"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_check_time"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_check_time ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_check_time"]
    end
    tb.curtime = {}

    tb.encode = function(byteArray)
        tb.curtime.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.curtime = stime();
        tb.curtime.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_check_time"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_repeat_login ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_repeat_login"]
    end
    tb.account = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.account)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.account = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_repeat_login"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_create_role ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_create_role"]
    end
    tb.nickname = ""
    tb.server_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.nickname)
    	byteArray.write_int(tb.server_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.nickname = byteArray.read_string();
        tb.server_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_create_role"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_create_role_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_create_role_result"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_create_role_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_role_info_msg ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_role_info_msg"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_role_info_msg"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_roleinfo_msg ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_roleinfo_msg"]
    end
    tb.id = 0
    tb.nickname = ""
    tb.head_photo = ""
    tb.money = 0
    tb.vip_lv = 0
    tb.sex = 0
    tb.signature = ""
    tb.mobile = ""
    tb.bank_money = 0
    tb.password_state = 0
    tb.agent_level = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.id)
    	byteArray.write_string(tb.nickname)
    	byteArray.write_string(tb.head_photo)
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.vip_lv)
    	byteArray.write_int(tb.sex)
    	byteArray.write_string(tb.signature)
    	byteArray.write_string(tb.mobile)
    	byteArray.write_uint64(tb.bank_money)
    	byteArray.write_int(tb.password_state)
    	byteArray.write_int(tb.agent_level)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_uint64();
        tb.nickname = byteArray.read_string();
        tb.head_photo = byteArray.read_string();
        tb.money = byteArray.read_int();
        tb.vip_lv = byteArray.read_int();
        tb.sex = byteArray.read_int();
        tb.signature = byteArray.read_string();
        tb.mobile = byteArray.read_string();
        tb.bank_money = byteArray.read_uint64();
        tb.password_state = byteArray.read_int();
        tb.agent_level = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_roleinfo_msg"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_roleinfo_with_id ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_roleinfo_with_id"]
    end
    tb.id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_roleinfo_with_id"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_roleinfo_with_id ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_roleinfo_with_id"]
    end
    tb.id = 0
    tb.nickname = ""
    tb.head_photo = ""
    tb.money = 0
    tb.vip_lv = 0
    tb.sex = 0
    tb.signature = ""

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.id)
    	byteArray.write_string(tb.nickname)
    	byteArray.write_string(tb.head_photo)
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.vip_lv)
    	byteArray.write_int(tb.sex)
    	byteArray.write_string(tb.signature)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_uint64();
        tb.nickname = byteArray.read_string();
        tb.head_photo = byteArray.read_string();
        tb.money = byteArray.read_int();
        tb.vip_lv = byteArray.read_int();
        tb.sex = byteArray.read_int();
        tb.signature = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_roleinfo_with_id"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_game_reconnect ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_game_reconnect"]
    end
    tb.version = 0
    tb.user_id = ""
    tb.token = ""

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.version)
    	byteArray.write_string(tb.user_id)
    	byteArray.write_string(tb.token)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.version = byteArray.read_int();
        tb.user_id = byteArray.read_string();
        tb.token = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_game_reconnect"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_reconnect_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_reconnect_result"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_reconnect_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_money_update ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_money_update"]
    end
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_money_update"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_rename ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_rename"]
    end
    tb.new_name = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.new_name)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.new_name = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_rename"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_rename_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_rename_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_rename_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_select_head_icon ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_select_head_icon"]
    end
    tb.new_head_icon = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.new_head_icon)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.new_head_icon = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_select_head_icon"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_select_head_icon_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_select_head_icon_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_select_head_icon_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_update_sex ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_update_sex"]
    end
    tb.new_sex = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.new_sex)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.new_sex = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_update_sex"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_update_sex_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_update_sex_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_update_sex_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_update_signature ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_update_signature"]
    end
    tb.new_signature = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.new_signature)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.new_signature = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_update_signature"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_update_signature_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_update_signature_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_update_signature_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_set_bank_password ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_set_bank_password"]
    end
    tb.password = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.password)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.password = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_set_bank_password"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_set_bank_password_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_set_bank_password_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_set_bank_password_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_reset_bank_password ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_reset_bank_password"]
    end
    tb.old_password = ""
    tb.new_password = ""
    tb.new_password_confirm = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.old_password)
    	byteArray.write_string(tb.new_password)
    	byteArray.write_string(tb.new_password_confirm)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.old_password = byteArray.read_string();
        tb.new_password = byteArray.read_string();
        tb.new_password_confirm = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_reset_bank_password"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_reset_bank_password_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_reset_bank_password_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_reset_bank_password_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_get_bank_password ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_get_bank_password"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_get_bank_password"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_get_bank_password_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_get_bank_password_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_get_bank_password_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_set_mobile_apply ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_set_mobile_apply"]
    end
    tb.mobile = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.mobile)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.mobile = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_set_mobile_apply"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_set_mobile_apply_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_set_mobile_apply_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_set_mobile_apply_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_set_mobile ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_set_mobile"]
    end
    tb.verify_code = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.verify_code)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.verify_code = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_set_mobile"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_set_mobile_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_set_mobile_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_set_mobile_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_auth_bank_password ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_auth_bank_password"]
    end
    tb.password = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.password)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.password = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_auth_bank_password"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_auth_bank_password_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_auth_bank_password_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_auth_bank_password_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bank_save ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bank_save"]
    end
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bank_save"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bank_save_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bank_save_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bank_save_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bank_take ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bank_take"]
    end
    tb.money = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bank_take"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bank_take_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bank_take_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bank_take_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bank_transfer_apply ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bank_transfer_apply"]
    end
    tb.role_id = ""
    tb.money = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.role_id)
    	byteArray.write_string(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_string();
        tb.money = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bank_transfer_apply"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bank_transfer_apply_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bank_transfer_apply_result"]
    end
    tb.is_success = 0
    tb.role_id = 0
    tb.nickname = ""
    tb.money = ""

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_string(tb.nickname)
    	byteArray.write_string(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
        tb.role_id = byteArray.read_uint64();
        tb.nickname = byteArray.read_string();
        tb.money = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bank_transfer_apply_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bank_transfer_confirm ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bank_transfer_confirm"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bank_transfer_confirm"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bank_transfer_confirm_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bank_transfer_confirm_result"]
    end
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bank_transfer_confirm_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function transfer_log ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_transfer_log"]
    end
    tb.role_id = 0
    tb.money = 0
    tb.nickname = ""
    tb.time = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.money)
    	byteArray.write_string(tb.nickname)
        tb.time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.money = byteArray.read_int();
        tb.nickname = byteArray.read_string();
        tb.time = stime();
        tb.time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_transfer_log"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bank_transfer_log ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bank_transfer_log"]
    end
    tb.type = 0
    tb.page = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
    	byteArray.write_int(tb.page)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        tb.page = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bank_transfer_log"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bank_transfer_log ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bank_transfer_log"]
    end
    tb.type = 0
    tb.page = 0
    tb.log_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
    	byteArray.write_int(tb.page)
        byteArray.write_uint16(#(tb.log_list))
        for k, v in pairs(tb.log_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        tb.page = byteArray.read_int();
        local countOflog_list = byteArray.read_uint16()
        tb.log_list = {}
        for i = 1, countOflog_list do
            local temp = transfer_log()
            temp.decode(byteArray)
            table.insert(tb.log_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bank_transfer_log"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bank_money_refresh ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bank_money_refresh"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bank_money_refresh"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bank_money_refresh ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bank_money_refresh"]
    end
    tb.money = 0
    tb.bank_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
    	byteArray.write_uint64(tb.bank_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
        tb.bank_money = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bank_money_refresh"])
        return tb.encode(byteArray)
    end

    return tb

end

function rank_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_rank_item"]
    end
    tb.rank = 0
    tb.role_id = 0
    tb.head_icon = ""
    tb.nickname = ""
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.rank)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_string(tb.head_icon)
    	byteArray.write_string(tb.nickname)
    	byteArray.write_uint64(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.rank = byteArray.read_int();
        tb.role_id = byteArray.read_uint64();
        tb.head_icon = byteArray.read_string();
        tb.nickname = byteArray.read_string();
        tb.money = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_rank_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_rank_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_rank_list"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_rank_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_rank_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_rank_list"]
    end
    tb.rich_list = {}
    tb.win_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.rich_list))
        for k, v in pairs(tb.rich_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.win_list))
        for k, v in pairs(tb.win_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfrich_list = byteArray.read_uint16()
        tb.rich_list = {}
        for i = 1, countOfrich_list do
            local temp = rank_item()
            temp.decode(byteArray)
            table.insert(tb.rich_list, temp)
        end
        local countOfwin_list = byteArray.read_uint16()
        tb.win_list = {}
        for i = 1, countOfwin_list do
            local temp = rank_item()
            temp.decode(byteArray)
            table.insert(tb.win_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_rank_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function email ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_email"]
    end
    tb.email_id = ""
    tb.type = 0
    tb.email_type = 0
    tb.addressor = ""
    tb.title = ""
    tb.content = ""
    tb.attachments = {}
    tb.recv_time = {}
    tb.end_time = {}

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.email_id)
    	byteArray.write_uchar(tb.type)
    	byteArray.write_uchar(tb.email_type)
    	byteArray.write_string(tb.addressor)
    	byteArray.write_string(tb.title)
    	byteArray.write_string(tb.content)
        byteArray.write_uint16(#(tb.attachments))
        for k, v in pairs(tb.attachments) do
            byteArray = v.encode(byteArray)
        end
        tb.recv_time.encode(byteArray);
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.email_id = byteArray.read_string();
        tb.type = byteArray.read_uchar();
        tb.email_type = byteArray.read_uchar();
        tb.addressor = byteArray.read_string();
        tb.title = byteArray.read_string();
        tb.content = byteArray.read_string();
        local countOfattachments = byteArray.read_uint16()
        tb.attachments = {}
        for i = 1, countOfattachments do
            local temp = award_info()
            temp.decode(byteArray)
            table.insert(tb.attachments, temp)
        end
        tb.recv_time = stime();
        tb.recv_time.decode(byteArray);
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_email"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_email_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_email_list"]
    end
    tb.emails = {}
    tb.email_readed = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.emails))
        for k, v in pairs(tb.emails) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.email_readed))
        for k, v in pairs (tb.email_readed) do
            byteArray.write_string(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfemails = byteArray.read_uint16()
        tb.emails = {}
        for i = 1, countOfemails do
            local temp = email()
            temp.decode(byteArray)
            table.insert(tb.emails, temp)
        end
        local countOfemail_readed = byteArray.read_uint16()
        tb.email_readed = {}
        for i = 1, countOfemail_readed do
             table.insert(tb.email_readed, byteArray.read_string())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_email_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_get_email_attachments ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_get_email_attachments"]
    end
    tb.email_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.email_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.email_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_get_email_attachments"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_get_email_attachments ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_get_email_attachments"]
    end
    tb.email_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.email_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.email_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_get_email_attachments"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_new_email ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_new_email"]
    end
    tb.new_email = {}

    tb.encode = function(byteArray)
        tb.new_email.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.new_email = email();
        tb.new_email.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_new_email"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_read_email ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_read_email"]
    end
    tb.email_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.email_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.email_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_read_email"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_read_email ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_read_email"]
    end
    tb.email_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.email_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.email_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_read_email"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_add_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_add_money"]
    end
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_add_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_reduce_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_reduce_money"]
    end
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_reduce_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_pay_reward ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_pay_reward"]
    end
    tb.order_no = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.order_no)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.order_no = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_pay_reward"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_pay_reward ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_pay_reward"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_pay_reward"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_gm_run ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_gm_run"]
    end
    tb.gm_cmd = ""
    tb.gm_params = {}

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.gm_cmd)
        byteArray.write_uint16(#(tb.gm_params))
        for k, v in pairs (tb.gm_params) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.gm_cmd = byteArray.read_string();
        local countOfgm_params = byteArray.read_uint16()
        tb.gm_params = {}
        for i = 1, countOfgm_params do
             table.insert(tb.gm_params, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_gm_run"])
        return tb.encode(byteArray)
    end

    return tb

end

function award_state ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_award_state"]
    end
    tb.type = 0
    tb.state = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
    	byteArray.write_int(tb.state)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        tb.state = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_award_state"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_day_task ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_day_task"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_day_task"])
        return tb.encode(byteArray)
    end

    return tb

end

function task_msg ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_task_msg"]
    end
    tb.task_id = 0
    tb.cur_times = 0
    tb.state = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.task_id)
    	byteArray.write_int(tb.cur_times)
    	byteArray.write_int(tb.state)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.task_id = byteArray.read_int();
        tb.cur_times = byteArray.read_int();
        tb.state = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_task_msg"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_day_task ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_day_task"]
    end
    tb.task = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.task))
        for k, v in pairs(tb.task) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOftask = byteArray.read_uint16()
        tb.task = {}
        for i = 1, countOftask do
            local temp = task_msg()
            temp.decode(byteArray)
            table.insert(tb.task, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_day_task"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_day_task_state ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_day_task_state"]
    end
    tb.award_states = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.award_states))
        for k, v in pairs(tb.award_states) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfaward_states = byteArray.read_uint16()
        tb.award_states = {}
        for i = 1, countOfaward_states do
            local temp = award_state()
            temp.decode(byteArray)
            table.insert(tb.award_states, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_day_task_state"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_get_reward ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_get_reward"]
    end
    tb.id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_get_reward"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_get_reward ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_get_reward"]
    end
    tb.id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_get_reward"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_get_login_award ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_get_login_award"]
    end
    tb.days = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.days)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.days = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_get_login_award"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_get_login_award ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_get_login_award"]
    end
    tb.days = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.days)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.days = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_get_login_award"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_get_sign_award ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_get_sign_award"]
    end
    tb.days = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.days)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.days = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_get_sign_award"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_get_sign_award ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_get_sign_award"]
    end
    tb.days = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.days)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.days = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_get_sign_award"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_weixin_share_task_finish ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_weixin_share_task_finish"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_weixin_share_task_finish"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_weixin_share_task_finish ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_weixin_share_task_finish"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_weixin_share_task_finish"])
        return tb.encode(byteArray)
    end

    return tb

end

function shz_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_shz_item"]
    end
    tb.icon = 0
    tb.pos = 0
    tb.is_flash = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.icon)
    	byteArray.write_int(tb.pos)
    	byteArray.write_int(tb.is_flash)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.icon = byteArray.read_int();
        tb.pos = byteArray.read_int();
        tb.is_flash = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_shz_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_shz_lottery ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_shz_lottery"]
    end
    tb.line = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.line)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.line = byteArray.read_int();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_shz_lottery"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_shz_lottery_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_shz_lottery_result"]
    end
    tb.item_list = {}
    tb.lines = {}
    tb.money = 0
    tb.mali_times = 0

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.item_list))
        for k, v in pairs(tb.item_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.lines))
        for k, v in pairs (tb.lines) do
            byteArray.write_int(v)
        end
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.mali_times)
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfitem_list = byteArray.read_uint16()
        tb.item_list = {}
        for i = 1, countOfitem_list do
            local temp = shz_item()
            temp.decode(byteArray)
            table.insert(tb.item_list, temp)
        end
        local countOflines = byteArray.read_uint16()
        tb.lines = {}
        for i = 1, countOflines do
             table.insert(tb.lines, byteArray.read_int())
        end
        tb.money = byteArray.read_int();
        tb.mali_times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_shz_lottery_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_shz_bibei ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_shz_bibei"]
    end
    tb.bet = 0
    tb.dice = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet)
    	byteArray.write_int(tb.dice)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet = byteArray.read_int();
        tb.dice = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_shz_bibei"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_shz_bibei_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_shz_bibei_result"]
    end
    tb.get_score = 0
    tb.dice_list = {}
    tb.is_success = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.get_score)
        byteArray.write_uint16(#(tb.dice_list))
        for k, v in pairs (tb.dice_list) do
            byteArray.write_int(v)
        end
    	byteArray.write_int(tb.is_success)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.get_score = byteArray.read_int();
        local countOfdice_list = byteArray.read_uint16()
        tb.dice_list = {}
        for i = 1, countOfdice_list do
             table.insert(tb.dice_list, byteArray.read_int())
        end
        tb.is_success = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_shz_bibei_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_shz_mali ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_shz_mali"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_shz_mali"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_shz_mali_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_shz_mali_result"]
    end
    tb.get_score = {}
    tb.icon_list = {}
    tb.circle_icon = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.get_score))
        for k, v in pairs (tb.get_score) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.icon_list))
        for k, v in pairs (tb.icon_list) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.circle_icon))
        for k, v in pairs (tb.circle_icon) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfget_score = byteArray.read_uint16()
        tb.get_score = {}
        for i = 1, countOfget_score do
             table.insert(tb.get_score, byteArray.read_int())
        end
        local countOficon_list = byteArray.read_uint16()
        tb.icon_list = {}
        for i = 1, countOficon_list do
             table.insert(tb.icon_list, byteArray.read_int())
        end
        local countOfcircle_icon = byteArray.read_uint16()
        tb.circle_icon = {}
        for i = 1, countOfcircle_icon do
             table.insert(tb.circle_icon, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_shz_mali_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function room_table ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_room_table"]
    end
    tb.id = ""
    tb.name = ""
    tb.cur_count = 0

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.id)
    	byteArray.write_string(tb.name)
    	byteArray.write_int(tb.cur_count)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_string();
        tb.name = byteArray.read_string();
        tb.cur_count = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_room_table"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_table_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_table_list"]
    end
    tb.room_type = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.room_type)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.room_type = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_table_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_table_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_table_list"]
    end
    tb.table_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.table_list))
        for k, v in pairs(tb.table_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOftable_list = byteArray.read_uint16()
        tb.table_list = {}
        for i = 1, countOftable_list do
            local temp = room_table()
            temp.decode(byteArray)
            table.insert(tb.table_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_table_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function room_msg_kv ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_room_msg_kv"]
    end
    tb.key = ""
    tb.val = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.key)
    	byteArray.write_string(tb.val)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.key = byteArray.read_string();
        tb.val = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_room_msg_kv"])
        return tb.encode(byteArray)
    end

    return tb

end

function room_role_base ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_room_role_base"]
    end
    tb.role_id = 0
    tb.nickname = ""
    tb.money = 0
    tb.head_photo = ""
    tb.gender = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_string(tb.nickname)
    	byteArray.write_int(tb.money)
    	byteArray.write_string(tb.head_photo)
    	byteArray.write_int(tb.gender)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.nickname = byteArray.read_string();
        tb.money = byteArray.read_int();
        tb.head_photo = byteArray.read_string();
        tb.gender = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_room_role_base"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_leave_room ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_leave_room"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_leave_room"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_leave_room_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_leave_room_result"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_leave_room_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_leave_room ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_leave_room"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_leave_room"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_room_msg ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_room_msg"]
    end
    tb.msg_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.msg_list))
        for k, v in pairs(tb.msg_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfmsg_list = byteArray.read_uint16()
        tb.msg_list = {}
        for i = 1, countOfmsg_list do
            local temp = room_msg_kv()
            temp.decode(byteArray)
            table.insert(tb.msg_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_room_msg"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_enter_room ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_enter_room"]
    end
    tb.room_type_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.room_type_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.room_type_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_enter_room"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_enter_room_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_enter_room_result"]
    end
    tb.result = 0
    tb.room_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
    	byteArray.write_string(tb.room_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
        tb.room_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_enter_room_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_enter_room_with_room_id ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_enter_room_with_room_id"]
    end
    tb.room_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.room_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.room_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_enter_room_with_room_id"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_room_with_room_id_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_room_with_room_id_result"]
    end
    tb.result = 0
    tb.room_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
    	byteArray.write_string(tb.room_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
        tb.room_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_room_with_room_id_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_change_room ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_change_room"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_change_room"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_change_room_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_change_room_result"]
    end
    tb.result = 0
    tb.room_id = ""

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
    	byteArray.write_string(tb.room_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
        tb.room_id = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_change_room_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_role_enter ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_role_enter"]
    end
    tb.role = {}
    tb.pos = 0

    tb.encode = function(byteArray)
        tb.role.encode(byteArray);
    	byteArray.write_int(tb.pos)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role = room_role_base();
        tb.role.decode(byteArray);
        tb.pos = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_role_enter"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_role_prepare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_role_prepare"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_role_prepare"])
        return tb.encode(byteArray)
    end

    return tb

end

function room_role_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_room_role_money"]
    end
    tb.role_id = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_room_role_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_room_roles_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_room_roles_money"]
    end
    tb.roles_money_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.roles_money_list))
        for k, v in pairs(tb.roles_money_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfroles_money_list = byteArray.read_uint16()
        tb.roles_money_list = {}
        for i = 1, countOfroles_money_list do
            local temp = room_role_money()
            temp.decode(byteArray)
            table.insert(tb.roles_money_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_room_roles_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function role_get_money_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_role_get_money_item"]
    end
    tb.role_id = 0
    tb.get_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.get_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.get_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_role_get_money_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh_card_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh_card_item"]
    end
    tb.type = 0
    tb.cards = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh_card_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh_role_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh_role_item"]
    end
    tb.role_id = 0
    tb.sum_bet = 0
    tb.pos = 0
    tb.role_status = 0
    tb.is_card_showed = 0
    tb.is_give_up = 0
    tb.is_fail = 0
    tb.seconds_for_decision = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.sum_bet)
    	byteArray.write_int(tb.pos)
    	byteArray.write_int(tb.role_status)
    	byteArray.write_int(tb.is_card_showed)
    	byteArray.write_int(tb.is_give_up)
    	byteArray.write_int(tb.is_fail)
    	byteArray.write_int(tb.seconds_for_decision)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.sum_bet = byteArray.read_int();
        tb.pos = byteArray.read_int();
        tb.role_status = byteArray.read_int();
        tb.is_card_showed = byteArray.read_int();
        tb.is_give_up = byteArray.read_int();
        tb.is_fail = byteArray.read_int();
        tb.seconds_for_decision = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh_role_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh_game_role_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh_game_role_info"]
    end
    tb.role_id = 0
    tb.role_base = {}
    tb.role_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        tb.role_base.encode(byteArray);
        tb.role_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.role_base = room_role_base();
        tb.role_base.decode(byteArray);
        tb.role_item = zjh_role_item();
        tb.role_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh_game_role_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_prepare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_prepare"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_prepare"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_allin ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_allin"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_allin"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_see_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_see_cards"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_see_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_apply_compare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_apply_compare"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_apply_compare"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_compare_role ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_compare_role"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_compare_role"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_follow ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_follow"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_follow"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_add_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_add_bet"]
    end
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_add_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh_give_up ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh_give_up"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh_give_up"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_card_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_card_item"]
    end
    tb.card_item = {}

    tb.encode = function(byteArray)
        tb.card_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.card_item = zjh_card_item();
        tb.card_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_card_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_room_info"]
    end
    tb.game_status = 0
    tb.roles = {}
    tb.banker = 0
    tb.cur_operator = 0
    tb.cur_total_bet = 0
    tb.cur_bet = 0
    tb.chip_link = {}
    tb.rand_seed = 0
    tb.cur_round = 0
    tb.start_time = {}
    tb.my_card_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        byteArray.write_uint16(#(tb.roles))
        for k, v in pairs(tb.roles) do
            byteArray = v.encode(byteArray)
        end
    	byteArray.write_uint64(tb.banker)
    	byteArray.write_uint64(tb.cur_operator)
    	byteArray.write_int(tb.cur_total_bet)
    	byteArray.write_int(tb.cur_bet)
        byteArray.write_uint16(#(tb.chip_link))
        for k, v in pairs (tb.chip_link) do
            byteArray.write_int(v)
        end
    	byteArray.write_int(tb.rand_seed)
    	byteArray.write_int(tb.cur_round)
        tb.start_time.encode(byteArray);
        tb.my_card_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        local countOfroles = byteArray.read_uint16()
        tb.roles = {}
        for i = 1, countOfroles do
            local temp = zjh_game_role_info()
            temp.decode(byteArray)
            table.insert(tb.roles, temp)
        end
        tb.banker = byteArray.read_uint64();
        tb.cur_operator = byteArray.read_uint64();
        tb.cur_total_bet = byteArray.read_int();
        tb.cur_bet = byteArray.read_int();
        local countOfchip_link = byteArray.read_uint16()
        tb.chip_link = {}
        for i = 1, countOfchip_link do
             table.insert(tb.chip_link, byteArray.read_int())
        end
        tb.rand_seed = byteArray.read_int();
        tb.cur_round = byteArray.read_int();
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
        tb.my_card_item = zjh_card_item();
        tb.my_card_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_game_start ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_game_start"]
    end
    tb.role_ids = {}
    tb.banker_id = 0

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.role_ids))
        for k, v in pairs (tb.role_ids) do
            byteArray.write_uint64(v)
        end
    	byteArray.write_uint64(tb.banker_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfrole_ids = byteArray.read_uint16()
        tb.role_ids = {}
        for i = 1, countOfrole_ids do
             table.insert(tb.role_ids, byteArray.read_uint64())
        end
        tb.banker_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_game_start"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_round_update ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_round_update"]
    end
    tb.round = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.round)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.round = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_round_update"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_see_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_see_cards"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_see_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_start_counting"]
    end
    tb.start_time = {}

    tb.encode = function(byteArray)
        tb.start_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_allin ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_allin"]
    end
    tb.role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_allin"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_apply_compare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_apply_compare"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_apply_compare"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_compare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_compare"]
    end
    tb.a_role_id = 0
    tb.b_role_id = 0
    tb.win_role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.a_role_id)
    	byteArray.write_uint64(tb.b_role_id)
    	byteArray.write_uint64(tb.win_role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.a_role_id = byteArray.read_uint64();
        tb.b_role_id = byteArray.read_uint64();
        tb.win_role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_compare"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_follow ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_follow"]
    end
    tb.role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_follow"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_add_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_add_bet"]
    end
    tb.role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_add_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_give_up ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_give_up"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_give_up"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_operator_role ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_operator_role"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_operator_role"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh_settlement_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh_settlement_item"]
    end
    tb.role_id = 0
    tb.get_score = 0
    tb.card_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.get_score)
        tb.card_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.get_score = byteArray.read_int();
        tb.card_item = zjh_card_item();
        tb.card_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh_settlement_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh_settlement ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh_settlement"]
    end
    tb.win_role_id = 0
    tb.settlement_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.win_role_id)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.win_role_id = byteArray.read_uint64();
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = zjh_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh_settlement"])
        return tb.encode(byteArray)
    end

    return tb

end

function dn_card_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dn_card_item"]
    end
    tb.type = 0
    tb.cards = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dn_card_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function dn_role_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dn_role_item"]
    end
    tb.role_id = 0
    tb.pos = 0
    tb.role_status = 0
    tb.bet_times = 0
    tb.rob_times_index = 0
    tb.card_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.pos)
    	byteArray.write_int(tb.role_status)
    	byteArray.write_int(tb.bet_times)
    	byteArray.write_int(tb.rob_times_index)
        tb.card_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.pos = byteArray.read_int();
        tb.role_status = byteArray.read_int();
        tb.bet_times = byteArray.read_int();
        tb.rob_times_index = byteArray.read_int();
        tb.card_item = dn_card_item();
        tb.card_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dn_role_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function dn_game_role_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dn_game_role_info"]
    end
    tb.role_id = 0
    tb.role_base = {}
    tb.role_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        tb.role_base.encode(byteArray);
        tb.role_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.role_base = room_role_base();
        tb.role_base.decode(byteArray);
        tb.role_item = dn_role_item();
        tb.role_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dn_game_role_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_room_info"]
    end
    tb.game_status = 0
    tb.roles = {}
    tb.bet_base = 0
    tb.start_time = {}
    tb.banker = 0
    tb.rob_times = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        byteArray.write_uint16(#(tb.roles))
        for k, v in pairs(tb.roles) do
            byteArray = v.encode(byteArray)
        end
    	byteArray.write_int(tb.bet_base)
        tb.start_time.encode(byteArray);
    	byteArray.write_uint64(tb.banker)
    	byteArray.write_int(tb.rob_times)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        local countOfroles = byteArray.read_uint16()
        tb.roles = {}
        for i = 1, countOfroles do
            local temp = dn_game_role_info()
            temp.decode(byteArray)
            table.insert(tb.roles, temp)
        end
        tb.bet_base = byteArray.read_int();
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
        tb.banker = byteArray.read_uint64();
        tb.rob_times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dn_prepare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dn_prepare"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dn_prepare"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_start_counting"]
    end
    tb.start_time = {}

    tb.encode = function(byteArray)
        tb.start_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_game_start ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_game_start"]
    end
    tb.role_ids = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.role_ids))
        for k, v in pairs (tb.role_ids) do
            byteArray.write_uint64(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfrole_ids = byteArray.read_uint16()
        tb.role_ids = {}
        for i = 1, countOfrole_ids do
             table.insert(tb.role_ids, byteArray.read_uint64())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_game_start"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_show_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_show_card"]
    end
    tb.cards = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_show_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dn_rob_banker ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dn_rob_banker"]
    end
    tb.rob_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.rob_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.rob_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dn_rob_banker"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_rob_banker ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_rob_banker"]
    end
    tb.role_id = 0
    tb.rob_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.rob_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.rob_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_rob_banker"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_rob_banker_result ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_rob_banker_result"]
    end
    tb.banker = 0
    tb.rob_times = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.banker)
    	byteArray.write_int(tb.rob_times)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.banker = byteArray.read_uint64();
        tb.rob_times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_rob_banker_result"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dn_bet_times ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dn_bet_times"]
    end
    tb.bet_times_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_times_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_times_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dn_bet_times"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_bet_times ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_bet_times"]
    end
    tb.role_id = 0
    tb.bet_times = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.bet_times)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.bet_times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_bet_times"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_all_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_all_cards"]
    end
    tb.cards = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_all_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_select_cards_start ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_select_cards_start"]
    end
    tb.select_end_time = {}

    tb.encode = function(byteArray)
        tb.select_end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.select_end_time = stime();
        tb.select_end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_select_cards_start"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dn_select_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dn_select_cards"]
    end
    tb.cards_index = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.cards_index))
        for k, v in pairs (tb.cards_index) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfcards_index = byteArray.read_uint16()
        tb.cards_index = {}
        for i = 1, countOfcards_index do
             table.insert(tb.cards_index, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dn_select_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_select_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_select_cards"]
    end
    tb.role_id = 0
    tb.card_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        tb.card_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.card_item = dn_card_item();
        tb.card_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_select_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function dn_settlement_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dn_settlement_item"]
    end
    tb.role_id = 0
    tb.get_score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.get_score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.get_score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dn_settlement_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dn_settlement ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dn_settlement"]
    end
    tb.settlement_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = dn_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dn_settlement"])
        return tb.encode(byteArray)
    end

    return tb

end

function dot21_card_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dot21_card_item"]
    end
    tb.cards = {}
    tb.is_stop = 0

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
    	byteArray.write_int(tb.is_stop)
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
        tb.is_stop = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dot21_card_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function dot21_role_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dot21_role_item"]
    end
    tb.role_id = 0
    tb.pos = 0
    tb.chip_link = {}
    tb.card1 = {}
    tb.card2 = {}
    tb.is_bought_insurance = 0
    tb.role_status = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.pos)
        byteArray.write_uint16(#(tb.chip_link))
        for k, v in pairs (tb.chip_link) do
            byteArray.write_int(v)
        end
        tb.card1.encode(byteArray);
        tb.card2.encode(byteArray);
    	byteArray.write_int(tb.is_bought_insurance)
    	byteArray.write_int(tb.role_status)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.pos = byteArray.read_int();
        local countOfchip_link = byteArray.read_uint16()
        tb.chip_link = {}
        for i = 1, countOfchip_link do
             table.insert(tb.chip_link, byteArray.read_int())
        end
        tb.card1 = dot21_card_item();
        tb.card1.decode(byteArray);
        tb.card2 = dot21_card_item();
        tb.card2.decode(byteArray);
        tb.is_bought_insurance = byteArray.read_int();
        tb.role_status = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dot21_role_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function dot21_game_role_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dot21_game_role_info"]
    end
    tb.role_id = 0
    tb.role_base = {}
    tb.role_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        tb.role_base.encode(byteArray);
        tb.role_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.role_base = room_role_base();
        tb.role_base.decode(byteArray);
        tb.role_item = dot21_role_item();
        tb.role_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dot21_game_role_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_room_info"]
    end
    tb.game_status = 0
    tb.roles = {}
    tb.banker_card = {}
    tb.start_time = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        byteArray.write_uint16(#(tb.roles))
        for k, v in pairs(tb.roles) do
            byteArray = v.encode(byteArray)
        end
        tb.banker_card.encode(byteArray);
        tb.start_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        local countOfroles = byteArray.read_uint16()
        tb.roles = {}
        for i = 1, countOfroles do
            local temp = dot21_game_role_info()
            temp.decode(byteArray)
            table.insert(tb.roles, temp)
        end
        tb.banker_card = dot21_card_item();
        tb.banker_card.decode(byteArray);
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_start_counting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dot21_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dot21_bet"]
    end
    tb.bet_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dot21_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_bet"]
    end
    tb.role_id = 0
    tb.bet_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.bet_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.bet_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function dot21_role_with_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dot21_role_with_card"]
    end
    tb.role_id = 0
    tb.cards = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dot21_role_with_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_game_start ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_game_start"]
    end
    tb.roles = {}
    tb.is_insurance_open = 0
    tb.end_time = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.roles))
        for k, v in pairs(tb.roles) do
            byteArray = v.encode(byteArray)
        end
    	byteArray.write_int(tb.is_insurance_open)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfroles = byteArray.read_uint16()
        tb.roles = {}
        for i = 1, countOfroles do
            local temp = dot21_role_with_card()
            temp.decode(byteArray)
            table.insert(tb.roles, temp)
        end
        tb.is_insurance_open = byteArray.read_int();
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_game_start"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dot21_buy_insurance ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dot21_buy_insurance"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dot21_buy_insurance"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_buy_insurance ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_buy_insurance"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_buy_insurance"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dot21_divide_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dot21_divide_card"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dot21_divide_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_divide_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_divide_card"]
    end
    tb.role_id = 0
    tb.cards1 = {}
    tb.cards2 = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        byteArray.write_uint16(#(tb.cards1))
        for k, v in pairs (tb.cards1) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.cards2))
        for k, v in pairs (tb.cards2) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        local countOfcards1 = byteArray.read_uint16()
        tb.cards1 = {}
        for i = 1, countOfcards1 do
             table.insert(tb.cards1, byteArray.read_int())
        end
        local countOfcards2 = byteArray.read_uint16()
        tb.cards2 = {}
        for i = 1, countOfcards2 do
             table.insert(tb.cards2, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_divide_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dot21_get_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dot21_get_card"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dot21_get_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_get_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_get_card"]
    end
    tb.role_id = 0
    tb.card = 0
    tb.card_group = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.card)
    	byteArray.write_int(tb.card_group)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.card = byteArray.read_int();
        tb.card_group = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_get_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dot21_stop_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dot21_stop_card"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dot21_stop_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_stop_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_stop_card"]
    end
    tb.role_id = 0
    tb.card_group = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.card_group)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.card_group = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_stop_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dot21_double_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dot21_double_card"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dot21_double_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_double_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_double_card"]
    end
    tb.role_id = 0
    tb.card = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.card)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.card = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_double_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_banker_first_card ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_banker_first_card"]
    end
    tb.card = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.card)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.card = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_banker_first_card"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_banker_all_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_banker_all_cards"]
    end
    tb.cards = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_banker_all_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function dot21_settlement_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_dot21_settlement_item"]
    end
    tb.role_id = 0
    tb.cur_moeny = 0
    tb.get_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.cur_moeny)
    	byteArray.write_int(tb.get_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.cur_moeny = byteArray.read_int();
        tb.get_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_dot21_settlement_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buy_insurance_settlement ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buy_insurance_settlement"]
    end
    tb.settlement_list = {}
    tb.end_time = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = dot21_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buy_insurance_settlement"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dot21_settlement ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dot21_settlement"]
    end
    tb.settlement_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = dot21_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dot21_settlement"])
        return tb.encode(byteArray)
    end

    return tb

end

function niu100_pool_info_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_niu100_pool_info_item"]
    end
    tb.pool_index = 0
    tb.card_item = {}
    tb.bet_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pool_index)
        tb.card_item.encode(byteArray);
    	byteArray.write_int(tb.bet_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pool_index = byteArray.read_int();
        tb.card_item = dn_card_item();
        tb.card_item.decode(byteArray);
        tb.bet_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_niu100_pool_info_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function niu100_history_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_niu100_history_item"]
    end
    tb.result = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.result))
        for k, v in pairs (tb.result) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfresult = byteArray.read_uint16()
        tb.result = {}
        for i = 1, countOfresult do
             table.insert(tb.result, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_niu100_history_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_room_info"]
    end
    tb.game_status = 0
    tb.start_time = {}
    tb.banker = {}
    tb.banker_round = 0
    tb.player_list = {}
    tb.my_bet_info = {}
    tb.pool_info_list = {}
    tb.banker_candidate_list = {}
    tb.history_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        tb.start_time.encode(byteArray);
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.banker_round)
        byteArray.write_uint16(#(tb.player_list))
        for k, v in pairs(tb.player_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.my_bet_info))
        for k, v in pairs (tb.my_bet_info) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.pool_info_list))
        for k, v in pairs(tb.pool_info_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.banker_candidate_list))
        for k, v in pairs(tb.banker_candidate_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.history_list))
        for k, v in pairs(tb.history_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.banker_round = byteArray.read_int();
        local countOfplayer_list = byteArray.read_uint16()
        tb.player_list = {}
        for i = 1, countOfplayer_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.player_list, temp)
        end
        local countOfmy_bet_info = byteArray.read_uint16()
        tb.my_bet_info = {}
        for i = 1, countOfmy_bet_info do
             table.insert(tb.my_bet_info, byteArray.read_int())
        end
        local countOfpool_info_list = byteArray.read_uint16()
        tb.pool_info_list = {}
        for i = 1, countOfpool_info_list do
            local temp = niu100_pool_info_item()
            temp.decode(byteArray)
            table.insert(tb.pool_info_list, temp)
        end
        local countOfbanker_candidate_list = byteArray.read_uint16()
        tb.banker_candidate_list = {}
        for i = 1, countOfbanker_candidate_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate_list, temp)
        end
        local countOfhistory_list = byteArray.read_uint16()
        tb.history_list = {}
        for i = 1, countOfhistory_list do
            local temp = niu100_history_item()
            temp.decode(byteArray)
            table.insert(tb.history_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_start_counting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_start_beting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_start_beting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_start_beting"])
        return tb.encode(byteArray)
    end

    return tb

end

function niu100_settlement_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_niu100_settlement_item"]
    end
    tb.pool_index = 0
    tb.is_win = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pool_index)
    	byteArray.write_int(tb.is_win)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pool_index = byteArray.read_int();
        tb.is_win = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_niu100_settlement_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_myself_get_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_myself_get_money"]
    end
    tb.cur_money = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.cur_money)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.cur_money = byteArray.read_int();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_myself_get_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_start_comparing ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_start_comparing"]
    end
    tb.settlement_list = {}
    tb.pool_info_list = {}
    tb.banker_card_item = {}
    tb.role_get_money_list = {}
    tb.end_time = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.pool_info_list))
        for k, v in pairs(tb.pool_info_list) do
            byteArray = v.encode(byteArray)
        end
        tb.banker_card_item.encode(byteArray);
        byteArray.write_uint16(#(tb.role_get_money_list))
        for k, v in pairs(tb.role_get_money_list) do
            byteArray = v.encode(byteArray)
        end
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = niu100_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
        local countOfpool_info_list = byteArray.read_uint16()
        tb.pool_info_list = {}
        for i = 1, countOfpool_info_list do
            local temp = niu100_pool_info_item()
            temp.decode(byteArray)
            table.insert(tb.pool_info_list, temp)
        end
        tb.banker_card_item = dn_card_item();
        tb.banker_card_item.decode(byteArray);
        local countOfrole_get_money_list = byteArray.read_uint16()
        tb.role_get_money_list = {}
        for i = 1, countOfrole_get_money_list do
            local temp = role_get_money_item()
            temp.decode(byteArray)
            table.insert(tb.role_get_money_list, temp)
        end
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_start_comparing"])
        return tb.encode(byteArray)
    end

    return tb

end

function niu100_bet_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_niu100_bet_item"]
    end
    tb.role_id = 0
    tb.money = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.money = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_niu100_bet_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_niu100_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_niu100_bet"]
    end
    tb.bet_index = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_niu100_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_self_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_self_bet"]
    end
    tb.bet_info = {}

    tb.encode = function(byteArray)
        tb.bet_info.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_info = niu100_bet_item();
        tb.bet_info.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_self_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_bet"]
    end
    tb.bet_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.bet_list))
        for k, v in pairs(tb.bet_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbet_list = byteArray.read_uint16()
        tb.bet_list = {}
        for i = 1, countOfbet_list do
            local temp = niu100_bet_item()
            temp.decode(byteArray)
            table.insert(tb.bet_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_niu100_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_niu100_banker_list"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_niu100_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_banker_list"]
    end
    tb.banker_candidate = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.banker_candidate))
        for k, v in pairs(tb.banker_candidate) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbanker_candidate = byteArray.read_uint16()
        tb.banker_candidate = {}
        for i = 1, countOfbanker_candidate do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_niu100_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_niu100_banker_in"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_niu100_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_banker_in"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_niu100_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_niu100_banker_out"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_niu100_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_banker_out"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_niu100_cur_banker ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_niu100_cur_banker"]
    end
    tb.banker = {}
    tb.round = 0

    tb.encode = function(byteArray)
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.round)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.round = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_niu100_cur_banker"])
        return tb.encode(byteArray)
    end

    return tb

end

function bjl_pool_info_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bjl_pool_info_item"]
    end
    tb.pool_index = 0
    tb.bet_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pool_index)
    	byteArray.write_int(tb.bet_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pool_index = byteArray.read_int();
        tb.bet_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bjl_pool_info_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function bjl_history_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bjl_history_item"]
    end
    tb.result = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.result))
        for k, v in pairs (tb.result) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfresult = byteArray.read_uint16()
        tb.result = {}
        for i = 1, countOfresult do
             table.insert(tb.result, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bjl_history_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function bjl_history_point_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bjl_history_point_item"]
    end
    tb.banker_point = 0
    tb.player_point = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.banker_point)
    	byteArray.write_int(tb.player_point)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.banker_point = byteArray.read_int();
        tb.player_point = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bjl_history_point_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_room_info"]
    end
    tb.game_status = 0
    tb.start_time = {}
    tb.banker = {}
    tb.banker_round = 0
    tb.game_round = 0
    tb.game_turn = 0
    tb.player_list = {}
    tb.my_bet_info = {}
    tb.banker_card = {}
    tb.player_card = {}
    tb.pool_info_list = {}
    tb.banker_candidate_list = {}
    tb.history_point_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        tb.start_time.encode(byteArray);
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.banker_round)
    	byteArray.write_int(tb.game_round)
    	byteArray.write_int(tb.game_turn)
        byteArray.write_uint16(#(tb.player_list))
        for k, v in pairs(tb.player_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.my_bet_info))
        for k, v in pairs (tb.my_bet_info) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.banker_card))
        for k, v in pairs (tb.banker_card) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.player_card))
        for k, v in pairs (tb.player_card) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.pool_info_list))
        for k, v in pairs(tb.pool_info_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.banker_candidate_list))
        for k, v in pairs(tb.banker_candidate_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.history_point_list))
        for k, v in pairs(tb.history_point_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.banker_round = byteArray.read_int();
        tb.game_round = byteArray.read_int();
        tb.game_turn = byteArray.read_int();
        local countOfplayer_list = byteArray.read_uint16()
        tb.player_list = {}
        for i = 1, countOfplayer_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.player_list, temp)
        end
        local countOfmy_bet_info = byteArray.read_uint16()
        tb.my_bet_info = {}
        for i = 1, countOfmy_bet_info do
             table.insert(tb.my_bet_info, byteArray.read_int())
        end
        local countOfbanker_card = byteArray.read_uint16()
        tb.banker_card = {}
        for i = 1, countOfbanker_card do
             table.insert(tb.banker_card, byteArray.read_int())
        end
        local countOfplayer_card = byteArray.read_uint16()
        tb.player_card = {}
        for i = 1, countOfplayer_card do
             table.insert(tb.player_card, byteArray.read_int())
        end
        local countOfpool_info_list = byteArray.read_uint16()
        tb.pool_info_list = {}
        for i = 1, countOfpool_info_list do
            local temp = bjl_pool_info_item()
            temp.decode(byteArray)
            table.insert(tb.pool_info_list, temp)
        end
        local countOfbanker_candidate_list = byteArray.read_uint16()
        tb.banker_candidate_list = {}
        for i = 1, countOfbanker_candidate_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate_list, temp)
        end
        local countOfhistory_point_list = byteArray.read_uint16()
        tb.history_point_list = {}
        for i = 1, countOfhistory_point_list do
            local temp = bjl_history_point_item()
            temp.decode(byteArray)
            table.insert(tb.history_point_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_start_counting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_start_beting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_start_beting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_start_beting"])
        return tb.encode(byteArray)
    end

    return tb

end

function bjl_settlement_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bjl_settlement_item"]
    end
    tb.pool_index = 0
    tb.is_win = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pool_index)
    	byteArray.write_int(tb.is_win)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pool_index = byteArray.read_int();
        tb.is_win = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bjl_settlement_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_myself_get_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_myself_get_money"]
    end
    tb.cur_money = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.cur_money)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.cur_money = byteArray.read_int();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_myself_get_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_start_comparing ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_start_comparing"]
    end
    tb.settlement_list = {}
    tb.banker_card = {}
    tb.player_card = {}
    tb.role_get_money_list = {}
    tb.end_time = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.banker_card))
        for k, v in pairs (tb.banker_card) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.player_card))
        for k, v in pairs (tb.player_card) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.role_get_money_list))
        for k, v in pairs(tb.role_get_money_list) do
            byteArray = v.encode(byteArray)
        end
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = bjl_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
        local countOfbanker_card = byteArray.read_uint16()
        tb.banker_card = {}
        for i = 1, countOfbanker_card do
             table.insert(tb.banker_card, byteArray.read_int())
        end
        local countOfplayer_card = byteArray.read_uint16()
        tb.player_card = {}
        for i = 1, countOfplayer_card do
             table.insert(tb.player_card, byteArray.read_int())
        end
        local countOfrole_get_money_list = byteArray.read_uint16()
        tb.role_get_money_list = {}
        for i = 1, countOfrole_get_money_list do
            local temp = role_get_money_item()
            temp.decode(byteArray)
            table.insert(tb.role_get_money_list, temp)
        end
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_start_comparing"])
        return tb.encode(byteArray)
    end

    return tb

end

function bjl_bet_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bjl_bet_item"]
    end
    tb.role_id = 0
    tb.money = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.money = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bjl_bet_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bjl_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bjl_bet"]
    end
    tb.bet_index = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bjl_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_self_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_self_bet"]
    end
    tb.bet_info = {}

    tb.encode = function(byteArray)
        tb.bet_info.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_info = bjl_bet_item();
        tb.bet_info.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_self_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_bet"]
    end
    tb.bet_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.bet_list))
        for k, v in pairs(tb.bet_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbet_list = byteArray.read_uint16()
        tb.bet_list = {}
        for i = 1, countOfbet_list do
            local temp = bjl_bet_item()
            temp.decode(byteArray)
            table.insert(tb.bet_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bjl_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bjl_banker_list"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bjl_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_banker_list"]
    end
    tb.banker_candidate = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.banker_candidate))
        for k, v in pairs(tb.banker_candidate) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbanker_candidate = byteArray.read_uint16()
        tb.banker_candidate = {}
        for i = 1, countOfbanker_candidate do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bjl_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bjl_banker_in"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bjl_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_banker_in"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bjl_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bjl_banker_out"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bjl_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_banker_out"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bjl_cur_banker ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bjl_cur_banker"]
    end
    tb.banker = {}
    tb.round = 0
    tb.get_score = 0

    tb.encode = function(byteArray)
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.round)
    	byteArray.write_int(tb.get_score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.round = byteArray.read_int();
        tb.get_score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bjl_cur_banker"])
        return tb.encode(byteArray)
    end

    return tb

end

function bullet_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bullet_item"]
    end
    tb.bullet_id = 0
    tb.bullet_type = 0
    tb.angle = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bullet_id)
    	byteArray.write_int(tb.bullet_type)
    	byteArray.write_int(tb.angle)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bullet_id = byteArray.read_int();
        tb.bullet_type = byteArray.read_int();
        tb.angle = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bullet_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function cannon_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_cannon_item"]
    end
    tb.pos = 0
    tb.role_id = 0
    tb.role_base = {}
    tb.angle = 0
    tb.type = 0
    tb.times = 0
    tb.target_fish_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pos)
    	byteArray.write_uint64(tb.role_id)
        tb.role_base.encode(byteArray);
    	byteArray.write_int(tb.angle)
    	byteArray.write_int(tb.type)
    	byteArray.write_int(tb.times)
    	byteArray.write_int(tb.target_fish_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pos = byteArray.read_int();
        tb.role_id = byteArray.read_uint64();
        tb.role_base = room_role_base();
        tb.role_base.decode(byteArray);
        tb.angle = byteArray.read_int();
        tb.type = byteArray.read_int();
        tb.times = byteArray.read_int();
        tb.target_fish_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_cannon_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function buyu_fish_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_buyu_fish_item"]
    end
    tb.fish_id = 0
    tb.fish_tplt_id = 0
    tb.line_id = 0
    tb.life_time = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.fish_id)
    	byteArray.write_int(tb.fish_tplt_id)
    	byteArray.write_int(tb.line_id)
    	byteArray.write_int(tb.life_time)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.fish_id = byteArray.read_int();
        tb.fish_tplt_id = byteArray.read_int();
        tb.line_id = byteArray.read_int();
        tb.life_time = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_buyu_fish_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_room_info"]
    end
    tb.cannon_list = {}
    tb.bullet_list = {}
    tb.fish_list = {}
    tb.map_id = 0

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.cannon_list))
        for k, v in pairs(tb.cannon_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.bullet_list))
        for k, v in pairs(tb.bullet_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.fish_list))
        for k, v in pairs(tb.fish_list) do
            byteArray = v.encode(byteArray)
        end
    	byteArray.write_int(tb.map_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfcannon_list = byteArray.read_uint16()
        tb.cannon_list = {}
        for i = 1, countOfcannon_list do
            local temp = cannon_item()
            temp.decode(byteArray)
            table.insert(tb.cannon_list, temp)
        end
        local countOfbullet_list = byteArray.read_uint16()
        tb.bullet_list = {}
        for i = 1, countOfbullet_list do
            local temp = bullet_item()
            temp.decode(byteArray)
            table.insert(tb.bullet_list, temp)
        end
        local countOffish_list = byteArray.read_uint16()
        tb.fish_list = {}
        for i = 1, countOffish_list do
            local temp = buyu_fish_item()
            temp.decode(byteArray)
            table.insert(tb.fish_list, temp)
        end
        tb.map_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_buyu_shoot ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_buyu_shoot"]
    end
    tb.bullet_type = 0
    tb.angle = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bullet_type)
    	byteArray.write_int(tb.angle)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bullet_type = byteArray.read_int();
        tb.angle = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_buyu_shoot"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_shoot ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_shoot"]
    end
    tb.pos = 0
    tb.bullet = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pos)
        tb.bullet.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pos = byteArray.read_int();
        tb.bullet = bullet_item();
        tb.bullet.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_shoot"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_buyu_update_cannon_times ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_buyu_update_cannon_times"]
    end
    tb.times = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.times)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_buyu_update_cannon_times"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_update_cannon_times ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_update_cannon_times"]
    end
    tb.pos = 0
    tb.times = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pos)
    	byteArray.write_int(tb.times)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pos = byteArray.read_int();
        tb.times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_update_cannon_times"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_buyu_hit_fish ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_buyu_hit_fish"]
    end
    tb.bullet_id = 0
    tb.fish_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bullet_id)
    	byteArray.write_int(tb.fish_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bullet_id = byteArray.read_int();
        tb.fish_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_buyu_hit_fish"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_hit_fish ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_hit_fish"]
    end
    tb.is_hit = 0
    tb.bullet_id = 0
    tb.fish_id_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_hit)
    	byteArray.write_int(tb.bullet_id)
        byteArray.write_uint16(#(tb.fish_id_list))
        for k, v in pairs (tb.fish_id_list) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_hit = byteArray.read_int();
        tb.bullet_id = byteArray.read_int();
        local countOffish_id_list = byteArray.read_uint16()
        tb.fish_id_list = {}
        for i = 1, countOffish_id_list do
             table.insert(tb.fish_id_list, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_hit_fish"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_fish_spawn ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_fish_spawn"]
    end
    tb.fish_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.fish_list))
        for k, v in pairs(tb.fish_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOffish_list = byteArray.read_uint16()
        tb.fish_list = {}
        for i = 1, countOffish_list do
            local temp = buyu_fish_item()
            temp.decode(byteArray)
            table.insert(tb.fish_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_fish_spawn"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_change_map ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_change_map"]
    end
    tb.map_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.map_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.map_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_change_map"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_buyu_target_fish ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_buyu_target_fish"]
    end
    tb.fish_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.fish_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.fish_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_buyu_target_fish"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_target_fish ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_target_fish"]
    end
    tb.role_id = 0
    tb.fish_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.fish_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.fish_id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_target_fish"])
        return tb.encode(byteArray)
    end

    return tb

end

function texas_role_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_texas_role_item"]
    end
    tb.role_id = 0
    tb.sum_bet = 0
    tb.pos = 0
    tb.role_status = 0
    tb.is_card_showed = 0
    tb.is_give_up = 0
    tb.is_fail = 0
    tb.seconds_for_decision = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.sum_bet)
    	byteArray.write_int(tb.pos)
    	byteArray.write_int(tb.role_status)
    	byteArray.write_int(tb.is_card_showed)
    	byteArray.write_int(tb.is_give_up)
    	byteArray.write_int(tb.is_fail)
    	byteArray.write_int(tb.seconds_for_decision)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.sum_bet = byteArray.read_int();
        tb.pos = byteArray.read_int();
        tb.role_status = byteArray.read_int();
        tb.is_card_showed = byteArray.read_int();
        tb.is_give_up = byteArray.read_int();
        tb.is_fail = byteArray.read_int();
        tb.seconds_for_decision = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_texas_role_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function texas_game_role_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_texas_game_role_info"]
    end
    tb.role_id = 0
    tb.role_base = {}
    tb.role_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        tb.role_base.encode(byteArray);
        tb.role_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.role_base = room_role_base();
        tb.role_base.decode(byteArray);
        tb.role_item = texas_role_item();
        tb.role_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_texas_game_role_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_prepare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_prepare"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_prepare"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_allin ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_allin"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_allin"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_see_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_see_cards"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_see_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_apply_compare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_apply_compare"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_apply_compare"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_compare_role ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_compare_role"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_compare_role"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_follow ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_follow"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_follow"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_add_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_add_bet"]
    end
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_add_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_texas_give_up ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_texas_give_up"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_texas_give_up"])
        return tb.encode(byteArray)
    end

    return tb

end

function texas_card_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_texas_card_item"]
    end
    tb.type = 0
    tb.cards = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.type)
        byteArray.write_uint16(#(tb.cards))
        for k, v in pairs (tb.cards) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.type = byteArray.read_int();
        local countOfcards = byteArray.read_uint16()
        tb.cards = {}
        for i = 1, countOfcards do
             table.insert(tb.cards, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_texas_card_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_card_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_card_item"]
    end
    tb.card_item = {}

    tb.encode = function(byteArray)
        tb.card_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.card_item = texas_card_item();
        tb.card_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_card_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_room_info"]
    end
    tb.game_status = 0
    tb.roles = {}
    tb.banker = 0
    tb.cur_operator = 0
    tb.cur_total_bet = 0
    tb.cur_bet = 0
    tb.chip_link = {}
    tb.rand_seed = 0
    tb.cur_round = 0
    tb.start_time = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        byteArray.write_uint16(#(tb.roles))
        for k, v in pairs(tb.roles) do
            byteArray = v.encode(byteArray)
        end
    	byteArray.write_uint64(tb.banker)
    	byteArray.write_uint64(tb.cur_operator)
    	byteArray.write_int(tb.cur_total_bet)
    	byteArray.write_int(tb.cur_bet)
        byteArray.write_uint16(#(tb.chip_link))
        for k, v in pairs (tb.chip_link) do
            byteArray.write_int(v)
        end
    	byteArray.write_int(tb.rand_seed)
    	byteArray.write_int(tb.cur_round)
        tb.start_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        local countOfroles = byteArray.read_uint16()
        tb.roles = {}
        for i = 1, countOfroles do
            local temp = texas_game_role_info()
            temp.decode(byteArray)
            table.insert(tb.roles, temp)
        end
        tb.banker = byteArray.read_uint64();
        tb.cur_operator = byteArray.read_uint64();
        tb.cur_total_bet = byteArray.read_int();
        tb.cur_bet = byteArray.read_int();
        local countOfchip_link = byteArray.read_uint16()
        tb.chip_link = {}
        for i = 1, countOfchip_link do
             table.insert(tb.chip_link, byteArray.read_int())
        end
        tb.rand_seed = byteArray.read_int();
        tb.cur_round = byteArray.read_int();
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_game_start ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_game_start"]
    end
    tb.role_ids = {}
    tb.banker_id = 0

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.role_ids))
        for k, v in pairs (tb.role_ids) do
            byteArray.write_uint64(v)
        end
    	byteArray.write_uint64(tb.banker_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfrole_ids = byteArray.read_uint16()
        tb.role_ids = {}
        for i = 1, countOfrole_ids do
             table.insert(tb.role_ids, byteArray.read_uint64())
        end
        tb.banker_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_game_start"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_round_update ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_round_update"]
    end
    tb.round = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.round)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.round = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_round_update"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_see_cards ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_see_cards"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_see_cards"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_start_counting"]
    end
    tb.start_time = {}

    tb.encode = function(byteArray)
        tb.start_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_allin ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_allin"]
    end
    tb.role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_allin"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_apply_compare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_apply_compare"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_apply_compare"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_compare ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_compare"]
    end
    tb.a_role_id = 0
    tb.b_role_id = 0
    tb.win_role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.a_role_id)
    	byteArray.write_uint64(tb.b_role_id)
    	byteArray.write_uint64(tb.win_role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.a_role_id = byteArray.read_uint64();
        tb.b_role_id = byteArray.read_uint64();
        tb.win_role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_compare"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_follow ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_follow"]
    end
    tb.role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_follow"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_add_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_add_bet"]
    end
    tb.role_id = 0
    tb.score = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.score)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.score = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_add_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_give_up ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_give_up"]
    end
    tb.role_id = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_give_up"])
        return tb.encode(byteArray)
    end

    return tb

end

function texas_settlement_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_texas_settlement_item"]
    end
    tb.role_id = 0
    tb.get_score = 0
    tb.card_item = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.get_score)
        tb.card_item.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.get_score = byteArray.read_int();
        tb.card_item = texas_card_item();
        tb.card_item.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_texas_settlement_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_texas_settlement ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_texas_settlement"]
    end
    tb.win_role_id = 0
    tb.settlement_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.win_role_id)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.win_role_id = byteArray.read_uint64();
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = texas_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_texas_settlement"])
        return tb.encode(byteArray)
    end

    return tb

end

function scratch_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_scratch_item"]
    end
    tb.icon = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.icon)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.icon = byteArray.read_int();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_scratch_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_scratch_ticket ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_scratch_ticket"]
    end
    tb.room_type_id = 0
    tb.count = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.room_type_id)
    	byteArray.write_int(tb.count)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.room_type_id = byteArray.read_int();
        tb.count = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_scratch_ticket"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_scratch_ticket ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_scratch_ticket"]
    end
    tb.times_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.times_list))
        for k, v in pairs (tb.times_list) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOftimes_list = byteArray.read_uint16()
        tb.times_list = {}
        for i = 1, countOftimes_list do
             table.insert(tb.times_list, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_scratch_ticket"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_odd_monkey ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_odd_monkey"]
    end
    tb.bet_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_odd_monkey"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_odd_monkey ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_odd_monkey"]
    end
    tb.times = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.times)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_odd_monkey"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_odd_monkey_jackpot ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_odd_monkey_jackpot"]
    end
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_odd_monkey_jackpot"])
        return tb.encode(byteArray)
    end

    return tb

end

function bmw_pool_info_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bmw_pool_info_item"]
    end
    tb.pool_index = 0
    tb.bet_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pool_index)
    	byteArray.write_int(tb.bet_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pool_index = byteArray.read_int();
        tb.bet_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bmw_pool_info_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_room_info"]
    end
    tb.game_status = 0
    tb.start_time = {}
    tb.banker = {}
    tb.banker_round = 0
    tb.player_list = {}
    tb.my_bet_info = {}
    tb.pool_info_list = {}
    tb.banker_candidate_list = {}
    tb.history_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        tb.start_time.encode(byteArray);
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.banker_round)
        byteArray.write_uint16(#(tb.player_list))
        for k, v in pairs(tb.player_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.my_bet_info))
        for k, v in pairs (tb.my_bet_info) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.pool_info_list))
        for k, v in pairs(tb.pool_info_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.banker_candidate_list))
        for k, v in pairs(tb.banker_candidate_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.history_list))
        for k, v in pairs (tb.history_list) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.banker_round = byteArray.read_int();
        local countOfplayer_list = byteArray.read_uint16()
        tb.player_list = {}
        for i = 1, countOfplayer_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.player_list, temp)
        end
        local countOfmy_bet_info = byteArray.read_uint16()
        tb.my_bet_info = {}
        for i = 1, countOfmy_bet_info do
             table.insert(tb.my_bet_info, byteArray.read_int())
        end
        local countOfpool_info_list = byteArray.read_uint16()
        tb.pool_info_list = {}
        for i = 1, countOfpool_info_list do
            local temp = bmw_pool_info_item()
            temp.decode(byteArray)
            table.insert(tb.pool_info_list, temp)
        end
        local countOfbanker_candidate_list = byteArray.read_uint16()
        tb.banker_candidate_list = {}
        for i = 1, countOfbanker_candidate_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate_list, temp)
        end
        local countOfhistory_list = byteArray.read_uint16()
        tb.history_list = {}
        for i = 1, countOfhistory_list do
             table.insert(tb.history_list, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_start_counting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_start_beting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_start_beting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_start_beting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_myself_get_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_myself_get_money"]
    end
    tb.cur_money = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.cur_money)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.cur_money = byteArray.read_int();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_myself_get_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function bmw_win_rank_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bmw_win_rank_item"]
    end
    tb.nickname = ""
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.nickname)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.nickname = byteArray.read_string();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bmw_win_rank_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_start_comparing ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_start_comparing"]
    end
    tb.pool_info_list = {}
    tb.bmw_random_index = 0
    tb.win_pool_index = 0
    tb.role_get_money_list = {}
    tb.end_time = {}
    tb.rank_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.pool_info_list))
        for k, v in pairs(tb.pool_info_list) do
            byteArray = v.encode(byteArray)
        end
    	byteArray.write_int(tb.bmw_random_index)
    	byteArray.write_int(tb.win_pool_index)
        byteArray.write_uint16(#(tb.role_get_money_list))
        for k, v in pairs(tb.role_get_money_list) do
            byteArray = v.encode(byteArray)
        end
        tb.end_time.encode(byteArray);
        byteArray.write_uint16(#(tb.rank_list))
        for k, v in pairs(tb.rank_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfpool_info_list = byteArray.read_uint16()
        tb.pool_info_list = {}
        for i = 1, countOfpool_info_list do
            local temp = bmw_pool_info_item()
            temp.decode(byteArray)
            table.insert(tb.pool_info_list, temp)
        end
        tb.bmw_random_index = byteArray.read_int();
        tb.win_pool_index = byteArray.read_int();
        local countOfrole_get_money_list = byteArray.read_uint16()
        tb.role_get_money_list = {}
        for i = 1, countOfrole_get_money_list do
            local temp = role_get_money_item()
            temp.decode(byteArray)
            table.insert(tb.role_get_money_list, temp)
        end
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
        local countOfrank_list = byteArray.read_uint16()
        tb.rank_list = {}
        for i = 1, countOfrank_list do
            local temp = bmw_win_rank_item()
            temp.decode(byteArray)
            table.insert(tb.rank_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_start_comparing"])
        return tb.encode(byteArray)
    end

    return tb

end

function bmw_bet_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_bmw_bet_item"]
    end
    tb.role_id = 0
    tb.money = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.money = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_bmw_bet_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bmw_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bmw_bet"]
    end
    tb.bet_index = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bmw_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_self_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_self_bet"]
    end
    tb.bet_info = {}

    tb.encode = function(byteArray)
        tb.bet_info.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_info = bmw_bet_item();
        tb.bet_info.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_self_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_bet"]
    end
    tb.bet_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.bet_list))
        for k, v in pairs(tb.bet_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbet_list = byteArray.read_uint16()
        tb.bet_list = {}
        for i = 1, countOfbet_list do
            local temp = bmw_bet_item()
            temp.decode(byteArray)
            table.insert(tb.bet_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bmw_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bmw_banker_list"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bmw_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_banker_list"]
    end
    tb.banker_candidate = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.banker_candidate))
        for k, v in pairs(tb.banker_candidate) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbanker_candidate = byteArray.read_uint16()
        tb.banker_candidate = {}
        for i = 1, countOfbanker_candidate do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bmw_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bmw_banker_in"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bmw_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_banker_in"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_bmw_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_bmw_banker_out"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_bmw_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_banker_out"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_bmw_cur_banker ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_bmw_cur_banker"]
    end
    tb.banker = {}
    tb.round = 0

    tb.encode = function(byteArray)
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.round)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.round = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_bmw_cur_banker"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_lhdb ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_lhdb"]
    end
    tb.bet_index = 0
    tb.bet_line = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
    	byteArray.write_int(tb.bet_line)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
        tb.bet_line = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_lhdb"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_lhdb ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_lhdb"]
    end
    tb.times = 0
    tb.cur_rate = 0
    tb.is_get_drill = 0
    tb.bet_index = 0
    tb.bet_line = 0
    tb.remain_brick = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.times)
    	byteArray.write_int(tb.cur_rate)
    	byteArray.write_int(tb.is_get_drill)
    	byteArray.write_int(tb.bet_index)
    	byteArray.write_int(tb.bet_line)
    	byteArray.write_int(tb.remain_brick)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.times = byteArray.read_int();
        tb.cur_rate = byteArray.read_int();
        tb.is_get_drill = byteArray.read_int();
        tb.bet_index = byteArray.read_int();
        tb.bet_line = byteArray.read_int();
        tb.remain_brick = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_lhdb"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_lhdb_jackpot ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_lhdb_jackpot"]
    end
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_lhdb_jackpot"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_lhdb_game_save ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_lhdb_game_save"]
    end
    tb.is_game_save = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.is_game_save)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.is_game_save = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_lhdb_game_save"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_lhdb_game_save ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_lhdb_game_save"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_lhdb_game_save"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_lhdb_game_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_lhdb_game_info"]
    end
    tb.cur_rate = 0
    tb.remain_brick = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.cur_rate)
    	byteArray.write_int(tb.remain_brick)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.cur_rate = byteArray.read_int();
        tb.remain_brick = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_lhdb_game_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_dragon_ball ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_dragon_ball"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_dragon_ball"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_dragon_ball ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_dragon_ball"]
    end
    tb.get_money = 0
    tb.money_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.get_money)
        byteArray.write_uint16(#(tb.money_list))
        for k, v in pairs (tb.money_list) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.get_money = byteArray.read_int();
        local countOfmoney_list = byteArray.read_uint16()
        tb.money_list = {}
        for i = 1, countOfmoney_list do
             table.insert(tb.money_list, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_dragon_ball"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_huj5 ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_huj5"]
    end
    tb.bet_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_huj5"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_huj5 ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_huj5"]
    end
    tb.times = 0
    tb.get_jackpot_index = 0
    tb.get_jackpot_money = 0
    tb.box_times_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.times)
    	byteArray.write_int(tb.get_jackpot_index)
    	byteArray.write_int(tb.get_jackpot_money)
        byteArray.write_uint16(#(tb.box_times_list))
        for k, v in pairs (tb.box_times_list) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.times = byteArray.read_int();
        tb.get_jackpot_index = byteArray.read_int();
        tb.get_jackpot_money = byteArray.read_int();
        local countOfbox_times_list = byteArray.read_uint16()
        tb.box_times_list = {}
        for i = 1, countOfbox_times_list do
             table.insert(tb.box_times_list, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_huj5"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_huj5_jackpot ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_huj5_jackpot"]
    end
    tb.money = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.money))
        for k, v in pairs (tb.money) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfmoney = byteArray.read_uint16()
        tb.money = {}
        for i = 1, countOfmoney do
             table.insert(tb.money, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_huj5_jackpot"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_return_money_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_return_money_info"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_return_money_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_return_money_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_return_money_info"]
    end
    tb.return_money = ""

    tb.encode = function(byteArray)
    	byteArray.write_string(tb.return_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.return_money = byteArray.read_string();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_return_money_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_get_return_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_get_return_money"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_get_return_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_get_return_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_get_return_money"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_get_return_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh100_pool_info_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh100_pool_info_item"]
    end
    tb.pool_index = 0
    tb.card_item = {}
    tb.bet_money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pool_index)
        tb.card_item.encode(byteArray);
    	byteArray.write_int(tb.bet_money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pool_index = byteArray.read_int();
        tb.card_item = dn_card_item();
        tb.card_item.decode(byteArray);
        tb.bet_money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh100_pool_info_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh100_history_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh100_history_item"]
    end
    tb.result = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.result))
        for k, v in pairs (tb.result) do
            byteArray.write_int(v)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfresult = byteArray.read_uint16()
        tb.result = {}
        for i = 1, countOfresult do
             table.insert(tb.result, byteArray.read_int())
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh100_history_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_room_info"]
    end
    tb.game_status = 0
    tb.start_time = {}
    tb.banker = {}
    tb.banker_round = 0
    tb.player_list = {}
    tb.my_bet_info = {}
    tb.pool_info_list = {}
    tb.banker_candidate_list = {}
    tb.history_list = {}

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.game_status)
        tb.start_time.encode(byteArray);
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.banker_round)
        byteArray.write_uint16(#(tb.player_list))
        for k, v in pairs(tb.player_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.my_bet_info))
        for k, v in pairs (tb.my_bet_info) do
            byteArray.write_int(v)
        end
        byteArray.write_uint16(#(tb.pool_info_list))
        for k, v in pairs(tb.pool_info_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.banker_candidate_list))
        for k, v in pairs(tb.banker_candidate_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.history_list))
        for k, v in pairs(tb.history_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.game_status = byteArray.read_int();
        tb.start_time = stime();
        tb.start_time.decode(byteArray);
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.banker_round = byteArray.read_int();
        local countOfplayer_list = byteArray.read_uint16()
        tb.player_list = {}
        for i = 1, countOfplayer_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.player_list, temp)
        end
        local countOfmy_bet_info = byteArray.read_uint16()
        tb.my_bet_info = {}
        for i = 1, countOfmy_bet_info do
             table.insert(tb.my_bet_info, byteArray.read_int())
        end
        local countOfpool_info_list = byteArray.read_uint16()
        tb.pool_info_list = {}
        for i = 1, countOfpool_info_list do
            local temp = zjh100_pool_info_item()
            temp.decode(byteArray)
            table.insert(tb.pool_info_list, temp)
        end
        local countOfbanker_candidate_list = byteArray.read_uint16()
        tb.banker_candidate_list = {}
        for i = 1, countOfbanker_candidate_list do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate_list, temp)
        end
        local countOfhistory_list = byteArray.read_uint16()
        tb.history_list = {}
        for i = 1, countOfhistory_list do
            local temp = zjh100_history_item()
            temp.decode(byteArray)
            table.insert(tb.history_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_start_counting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_start_counting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_start_counting"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_start_beting ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_start_beting"]
    end
    tb.end_time = {}

    tb.encode = function(byteArray)
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_start_beting"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh100_settlement_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh100_settlement_item"]
    end
    tb.pool_index = 0
    tb.is_win = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.pool_index)
    	byteArray.write_int(tb.is_win)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.pool_index = byteArray.read_int();
        tb.is_win = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh100_settlement_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_myself_get_money ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_myself_get_money"]
    end
    tb.cur_money = 0
    tb.money = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.cur_money)
    	byteArray.write_int(tb.money)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.cur_money = byteArray.read_int();
        tb.money = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_myself_get_money"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_start_comparing ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_start_comparing"]
    end
    tb.settlement_list = {}
    tb.pool_info_list = {}
    tb.banker_card_item = {}
    tb.role_get_money_list = {}
    tb.end_time = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.settlement_list))
        for k, v in pairs(tb.settlement_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.pool_info_list))
        for k, v in pairs(tb.pool_info_list) do
            byteArray = v.encode(byteArray)
        end
        tb.banker_card_item.encode(byteArray);
        byteArray.write_uint16(#(tb.role_get_money_list))
        for k, v in pairs(tb.role_get_money_list) do
            byteArray = v.encode(byteArray)
        end
        tb.end_time.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfsettlement_list = byteArray.read_uint16()
        tb.settlement_list = {}
        for i = 1, countOfsettlement_list do
            local temp = zjh100_settlement_item()
            temp.decode(byteArray)
            table.insert(tb.settlement_list, temp)
        end
        local countOfpool_info_list = byteArray.read_uint16()
        tb.pool_info_list = {}
        for i = 1, countOfpool_info_list do
            local temp = zjh100_pool_info_item()
            temp.decode(byteArray)
            table.insert(tb.pool_info_list, temp)
        end
        tb.banker_card_item = dn_card_item();
        tb.banker_card_item.decode(byteArray);
        local countOfrole_get_money_list = byteArray.read_uint16()
        tb.role_get_money_list = {}
        for i = 1, countOfrole_get_money_list do
            local temp = role_get_money_item()
            temp.decode(byteArray)
            table.insert(tb.role_get_money_list, temp)
        end
        tb.end_time = stime();
        tb.end_time.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_start_comparing"])
        return tb.encode(byteArray)
    end

    return tb

end

function zjh100_bet_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_zjh100_bet_item"]
    end
    tb.role_id = 0
    tb.money = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_uint64(tb.role_id)
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.role_id = byteArray.read_uint64();
        tb.money = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_zjh100_bet_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh100_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh100_bet"]
    end
    tb.bet_index = 0
    tb.pool_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
    	byteArray.write_int(tb.pool_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
        tb.pool_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh100_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_self_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_self_bet"]
    end
    tb.bet_info = {}

    tb.encode = function(byteArray)
        tb.bet_info.encode(byteArray);
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_info = zjh100_bet_item();
        tb.bet_info.decode(byteArray);
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_self_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_bet ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_bet"]
    end
    tb.bet_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.bet_list))
        for k, v in pairs(tb.bet_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbet_list = byteArray.read_uint16()
        tb.bet_list = {}
        for i = 1, countOfbet_list do
            local temp = zjh100_bet_item()
            temp.decode(byteArray)
            table.insert(tb.bet_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_bet"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh100_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh100_banker_list"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh100_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_banker_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_banker_list"]
    end
    tb.banker_candidate = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.banker_candidate))
        for k, v in pairs(tb.banker_candidate) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfbanker_candidate = byteArray.read_uint16()
        tb.banker_candidate = {}
        for i = 1, countOfbanker_candidate do
            local temp = room_role_base()
            temp.decode(byteArray)
            table.insert(tb.banker_candidate, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_banker_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh100_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh100_banker_in"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh100_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_banker_in ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_banker_in"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_banker_in"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_zjh100_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_zjh100_banker_out"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_zjh100_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_banker_out ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_banker_out"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_banker_out"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_zjh100_cur_banker ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_zjh100_cur_banker"]
    end
    tb.banker = {}
    tb.round = 0

    tb.encode = function(byteArray)
        tb.banker.encode(byteArray);
    	byteArray.write_int(tb.round)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.banker = room_role_base();
        tb.banker.decode(byteArray);
        tb.round = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_zjh100_cur_banker"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_mobile_cancel ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_mobile_cancel"]
    end

    tb.encode = function(byteArray)
        return byteArray
    end

    tb.decode = function(byteArray)
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_mobile_cancel"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_mobile_cancel ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_mobile_cancel"]
    end
    tb.result = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.result)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.result = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_mobile_cancel"])
        return tb.encode(byteArray)
    end

    return tb

end

function laba_item ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_laba_item"]
    end
    tb.icon = 0
    tb.pos = 0
    tb.is_flash = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.icon)
    	byteArray.write_int(tb.pos)
    	byteArray.write_int(tb.is_flash)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.icon = byteArray.read_int();
        tb.pos = byteArray.read_int();
        tb.is_flash = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_laba_item"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_laba_room_info ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_laba_room_info"]
    end
    tb.free_times = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.free_times)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.free_times = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_laba_room_info"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_laba ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_laba"]
    end
    tb.bet_index = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.bet_index)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.bet_index = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_laba"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_laba ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_laba"]
    end
    tb.money = 0
    tb.free_times = 0
    tb.box_times = 0
    tb.item_list = {}
    tb.lines = {}
    tb.is_box_open = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.money)
    	byteArray.write_int(tb.free_times)
    	byteArray.write_int(tb.box_times)
        byteArray.write_uint16(#(tb.item_list))
        for k, v in pairs(tb.item_list) do
            byteArray = v.encode(byteArray)
        end
        byteArray.write_uint16(#(tb.lines))
        for k, v in pairs (tb.lines) do
            byteArray.write_int(v)
        end
    	byteArray.write_int(tb.is_box_open)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.money = byteArray.read_int();
        tb.free_times = byteArray.read_int();
        tb.box_times = byteArray.read_int();
        local countOfitem_list = byteArray.read_uint16()
        tb.item_list = {}
        for i = 1, countOfitem_list do
            local temp = laba_item()
            temp.decode(byteArray)
            table.insert(tb.item_list, temp)
        end
        local countOflines = byteArray.read_uint16()
        tb.lines = {}
        for i = 1, countOflines do
             table.insert(tb.lines, byteArray.read_int())
        end
        tb.is_box_open = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_laba"])
        return tb.encode(byteArray)
    end

    return tb

end

function notify_buyu_shoot_list ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_notify_buyu_shoot_list"]
    end
    tb.shoot_list = {}

    tb.encode = function(byteArray)
        byteArray.write_uint16(#(tb.shoot_list))
        for k, v in pairs(tb.shoot_list) do
            byteArray = v.encode(byteArray)
        end
        return byteArray
    end

    tb.decode = function(byteArray)
        local countOfshoot_list = byteArray.read_uint16()
        tb.shoot_list = {}
        for i = 1, countOfshoot_list do
            local temp = notify_buyu_shoot()
            temp.decode(byteArray)
            table.insert(tb.shoot_list, temp)
        end
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_notify_buyu_shoot_list"])
        return tb.encode(byteArray)
    end

    return tb

end

function req_gif ()
    local tb = {}
    tb.getMsgID = function()
        return NetMsgType["msg_req_gif"]
    end
    tb.id = 0

    tb.encode = function(byteArray)
    	byteArray.write_int(tb.id)
        return byteArray
    end

    tb.decode = function(byteArray)
        tb.id = byteArray.read_int();
    end

    tb.build = function(byteArray)
        byteArray.write_uint16(NetMsgType["msg_req_gif"])
        return tb.encode(byteArray)
    end

    return tb

end
