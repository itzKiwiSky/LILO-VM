local render = require 'src.Components.Modules.Engine.Render'
local virtualpad = require 'src.Components.Modules.Engine.Virtualpad'

local ScreenController = {}

function ScreenController.getScreenOrientation()
    if love.graphics.getWidth() > love.graphics.getHeight() then
        return "landscape"
    elseif love.graphics.getHeight() > love.graphics.getWidth() then
        return "portrait"
    end
end

function ScreenController.initialize()
    screenController.render = render()
    screenController.virtualpad = virtualpad()
end

function ScreenController.draw()
    if love.system.getOS() == "Android" or love.system.getOS() == "iOS" then
        if ScreenController.getScreenOrientation() == "portrait" then
            love.graphics.draw(screenController.render.canvas, 0, 0, 0, love.graphics.getWidth() / screenController.render.canvas:getWidth(), (love.graphics.getHeight() / screenController.render.canvas:getHeight()) * 0.40)
        elseif ScreenController.getScreenOrientation() == "landscape" then
            love.graphics.draw(screenController.render.canvas, 
            (love.graphics.getWidth() / 2) * 0.3, 
            (love.graphics.getHeight() / 2) * 0.2, 0, 
            (love.graphics.getWidth() / screenController.render.canvas:getWidth()) * 0.7, love.graphics.getHeight() / screenController.render.canvas:getHeight() * 0.8)
        end
        screenController.virtualpad:draw()
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(screenController.getScreenOrientation(), 10, 10)
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.draw(screenController.render.canvas, 0, 0, 0, love.graphics.getWidth() / screenController.render.canvas:getWidth(), love.graphics.getHeight() / screenController.render.canvas:getHeight())
    end
end

return ScreenController