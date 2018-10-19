
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"
require "socket_demo"

local function main()
    --require("app.MyApp"):create():run()

    SocketDemo.connect("127.0.0.1", 8888)
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
