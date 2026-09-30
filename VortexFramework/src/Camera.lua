local Camera = {}
Camera.__index = Camera

function Camera.new()
    return setmetatable({Position = nil, CFrame = nil, FieldOfView = 70}, Camera)
end

function Camera:SetPosition(value) self.Position = value end
function Camera:SetCFrame(value) self.CFrame = value end
function Camera:SetFieldOfView(value) self.FieldOfView = value end

return Camera
