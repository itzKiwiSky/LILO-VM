function love.conf(w)
    --% Window %--
    w.window.width          =       1280
    w.window.height         =       768
    w.window.icon           =       "icon.png"
    w.window.title          =       "LILO"
    w.window.x              =       nil
    w.window.y              =       nil
    w.window.borderless     =       false
    w.window.resizable      =       love.filesystem.isFused() and false or true
    w.window.fullscreen     =       false
    w.window.depth          =       16
    --w.window.vsync          =       0

    --% Debug %--
    w.console               =       love.filesystem.isFused() and false or true

    --% Storage %--
    w.externalstorage       =       true
    w.identity              =       "com.kiwiworlddominationinc.lilo"

    --% Modules %--
    w.modules.audio         =       true
    w.modules.data          =       true
    w.modules.event         =       true
    w.modules.font          =       true
    w.modules.graphics      =       true
    w.modules.image         =       true
    w.modules.joystick      =       true
    w.modules.keyboard      =       true
    w.modules.math          =       true
    w.modules.mouse         =       true
    w.modules.physics       =       true
    w.modules.sound         =       true
    w.modules.system        =       true
    w.modules.thread        =       true
    w.modules.timer         =       true
    w.modules.touch         =       true
    w.modules.video         =       true
    w.modules.window        =       true
end