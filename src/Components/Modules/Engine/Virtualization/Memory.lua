local Memory = {}
Memory.__index = Memory

local function _new(...)
    local self = setmetatable({}, Memory)
    self.allocTable = {}
    self.ram = {}

    for b = 0, 0xFFFF, 1 do
        self.ram[b] = 0
    end
    return self
end

function Memory:allocate(tag, from, to)
    self.allocTable[tag:lower()] = {
        from = from,
        to = to,
    }
end

return setmetatable(Memory, { __call = function(_, ...) return _new(...) end })