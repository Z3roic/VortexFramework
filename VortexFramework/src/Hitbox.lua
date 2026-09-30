local Hitbox = {}
Hitbox.__index = Hitbox

function Hitbox.new(position, size)
    return setmetatable({Position = position, Size = size, Active = false, OnHit = nil}, Hitbox)
end

function Hitbox:Start() self.Active = true end
function Hitbox:Stop() self.Active = false end
function Hitbox:SetCallback(callback) self.OnHit = callback end
function Hitbox:ReportHit(target)
    if self.Active and self.OnHit then self.OnHit(target) end
end

return Hitbox
