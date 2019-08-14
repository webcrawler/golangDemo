
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"
require "socket_ext"

local function main()
    --require("app.MyApp"):create():run()
    local function callback(code)
        if code == 0 then
            print("连接成功")
            SocketExt.send()
        elseif code == 1 then
            print("连接超时")
        elseif code == 2 then
            print("接受失败, 没有连接")
        end
    end
    SocketExt.connect("127.0.0.1", 8888, callback)
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
