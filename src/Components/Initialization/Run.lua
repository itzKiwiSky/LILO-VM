_G._screenBrightness = 0

require("src.Components.Initialization.Imports")()
require("src.Components.Initialization.AddonLoad")()
DEBUG_APP = love.filesystem.isFused() and false or true

function love.run()
    love.math.setRandomSeed(os.time())
    math.randomseed(os.time())

    if love.initialize then 
        love.initialize(love.arg.parseGameArguments(arg), arg)
    end

    if love.timer then love.timer.step() end

    local elapsed = 0

    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Main loop time.
    return function()
        -- Process events.
        if love.event then
            love.event.pump()
            for name, a,b,c,d,e,f in love.event.poll() do
                if name == "quit" then
                    if not love.quit or not love.quit() then
                        return a or 0
                    end
                end
                love.handlers[name](a,b,c,d,e,f)
            end
        end

        if love.timer then 
            elapsed = love.timer.step()
        end

        if love.update then 
            love.update(elapsed)
        end

        if love.graphics and love.graphics.isActive() then
            love.graphics.origin()
            love.graphics.clear(love.graphics.getBackgroundColor())
            
            if love.draw then
                love.draw()
            end
            love.graphics.setColor(0, 0, 0, _G._screenBrightness)
                love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
            love.graphics.setColor(1, 1, 1, 1)
            
            if DEBUG_APP then
                love.graphics.print("FPS : " .. love.timer.getFPS(), 5, 5)
            end

            love.graphics.present()
        end

        collectgarbage("collect")

        if love.timer then love.timer.sleep(0.001) end
    end
end