local Buffer = {}
Buffer.__index = Buffer

function Buffer.new()
    return setmetatable({Data = {}, Position = 1}, Buffer)
end

function Buffer:Write(value)
    self.Data[#self.Data + 1] = value
end

function Buffer:Read()
    local value = self.Data[self.Position]
    self.Position = self.Position + 1
    return value
end

function Buffer:Reset()
    self.Position = 1
end

return Buffer
