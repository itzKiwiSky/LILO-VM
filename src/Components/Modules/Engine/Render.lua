local gamecolors = require 'src.Components.Modules.Utils.GameColors' -- only for debug --
local Render = {}
Render.__index = Render

local function _new()
    local self = setmetatable({}, Render)
    self.canvas = love.graphics.newCanvas(256, 220)
    self.canvas:setFilter("nearest", "nearest")

    love.graphics.setCanvas(self.canvas)
    love.graphics.clear(1, 1, 1)
    for v = 0, 4000, 1 do
        local n = math.random(1, #gamecolors)
        love.graphics.setColor(gamecolors[n][1] / 255, gamecolors[n][2] / 255, gamecolors[n][3] / 255)
            love.graphics.points(math.random(0, 256), math.random(0, 220))
        love.graphics.setColor(1, 1, 1)
    end
    love.graphics.setCanvas()
    return self
end

function Render:queue()
    
end

function Render:drawCall()
    love.graphics.setCanvas(self.canvas)
    
    love.graphics.setCanvas()
end

return setmetatable(Render, { __call = function(_, ...) return _new(...) end })