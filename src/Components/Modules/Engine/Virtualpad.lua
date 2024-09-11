local Virtualpad = {}
Virtualpad.__index = Virtualpad

local function _new()
    local self = setmetatable({}, Virtualpad)
    self.screenOrientation = "portrait"
    self.buttons = {}
    self.assets = {}
    self.assets.touchpad = {}
    self.assets.touchpad.sheet, self.assets.touchpad.quads = love.graphics.getHashedQuads("assets/images/touchpad")
    self.assets.buttons = {}
    self.assets.buttons.sheet, self.assets.buttons.quads = love.graphics.getHashedQuads("assets/images/buttons")
    self.assets.neutral = {}
    self.assets.neutral.sheet, self.assets.neutral.quads = love.graphics.getHashedQuads("assets/images/neutral_button")
    --print(debug.formattable(self))
    self.touchareas = {}
    return self
end

function Virtualpad:draw()
    if self.screenOrientation == "portrait" then
        love.graphics.draw(self.assets.touchpad.sheet, self.assets.touchpad.quads["touchpad_new0"], 135, love.graphics.getHeight() / 2 + 150, 0, 2, 2, 64, 64)

        love.graphics.draw(self.assets.buttons.sheet, self.assets.buttons.quads["buttons_new yellow"], love.graphics.getWidth() - 240, love.graphics.getHeight() / 2 + 150, 0, 0.8, 0.8, 64, 64)

        love.graphics.draw(self.assets.buttons.sheet, self.assets.buttons.quads["buttons_new purple"], love.graphics.getWidth() - 150, love.graphics.getHeight() / 2 + 60, 0, 0.8, 0.8, 64, 64)

        love.graphics.draw(self.assets.buttons.sheet, self.assets.buttons.quads["buttons_new green"], love.graphics.getWidth() - 60, love.graphics.getHeight() / 2 + 150, 0, 0.8, 0.8, 64, 64)

        love.graphics.draw(self.assets.buttons.sheet, self.assets.buttons.quads["buttons_new red"], love.graphics.getWidth() - 150, love.graphics.getHeight() / 2 + 240, 0, 0.8, 0.8, 64, 64)


        love.graphics.draw(self.assets.neutral.sheet, self.assets.neutral.quads["neutral_button 1"], love.graphics.getWidth() / 2 - 60, love.graphics.getHeight() / 2 + 330, 0, 0.9, 0.9, 64, 64)
        love.graphics.draw(self.assets.neutral.sheet, self.assets.neutral.quads["neutral_button 1"], love.graphics.getWidth() / 2 + 60, love.graphics.getHeight() / 2 + 330, 0, 0.9, 0.9, 64, 64)
    elseif self.screenOrientation == "landscape" then
        
    end
end

return setmetatable(Virtualpad, { __call = function(_, ...) return _new(...) end })