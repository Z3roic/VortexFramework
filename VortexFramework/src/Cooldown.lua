local Cooldown = {}
Cooldown.__index = Cooldown

function Cooldown.new()
    return setmetatable({Active = {}}, Cooldown)
end

function Cooldown:Start(key, duration)
    self.Active[key] = os.clock() + duration
end

function Cooldown:Check(key)
    local expires = self.Active[key]
    if not expires then return false end
    if os.clock() >= expires then self.Active[key] = nil return false end
    return true, expires - os.clock()
end

function Cooldown:Reset(key)
    self.Active[key] = nil
end

function Cooldown:Clear()
    self.Active = {}
end

return Cooldown
