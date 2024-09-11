local Memory = {}
Memory.__index = Memory

local function _new(...)
    local self = setmetatable({}, Memory)
    self.allocTables = {}
    self.ram = {}

    for b = 0, 0xFFFF, 1 do
        self.ram[b] = 0xEA
    end
    return self
end

function Memory:allocate(tag, from, to)
    self.allocTable[tag:lower()] = {
        from = from,
        to = to,
    }
end

function Memory:getRange(tag)
    local allocRange = {}
    local idxrng = 1
    if self.allocTable[tag:lower()] then
        local range = self.allocTable[tag:lower()]
        for r = range.from, range.to, 1 do
            allocRange[idxrng] = self.ram[r]
            idxrng = idxrng + 1
        end
    end
    return allocRange
end

function Memory:set(address, value)
    if self.ram[address] then
        self.ram[address] = value
    else
        error("Out of range")
    end
end

return setmetatable(Memory, { __call = function(_, ...) return _new(...) end })