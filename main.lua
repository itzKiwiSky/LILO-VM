love.filesystem.load("src/Components/Initialization/Run.lua")()
love.filesystem.load("src/Components/Initialization/ErrorHandler.lua")()

function love.initialize(args)
    love.graphics.setBackgroundColor(0.4, 0.4, 0.4)
    love.graphics.setDefaultFilter("nearest", "nearest")
    memory = require 'src.Components.Modules.Engine.Virtualization.Memory'
    ram = memory()

    screenController = require 'src.Components.Modules.Engine.ScreenController'


    --[[
    LILO - Random Acess Memory (RAM) Mapping (64 KB)
    ---------------------
    [0x0000 - 0xDC00] Video framebuffer (56 KB)
    [0xDC01 - 0xDC21] io queue (32 Bytes)
    [0xDC22 - 0xDD22] Audio controller queue (256 Bytes)
    [0xDD23 - 0xE363] Object render queue (1.6 KB)
    ---------------------

    LILO - Cartdrigde mapping (64KB)
    ---------------------
    ---------------------

    LILO - Sprite queue mapping
    ---------------------
    64 Bytes colors
    2 Bytes Position X, Y
    1 Byte visible
    ]]--



    screenController.initialize()
end

function love.draw()
    screenController.draw()
end

function love.update(elapsed)

end

function love.keypressed(k)

end

function love.textinput(t)

end

function love.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)

end