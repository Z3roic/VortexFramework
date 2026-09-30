local Component = {}
Component.__index = Component

function Component.new(name)
    return setmetatable({Name = name, Instances = {}}, Component)
end

function Component:Attach(instance, data)
    self.Instances[instance] = data or {}
    return self.Instances[instance]
end

function Component:Detach(instance)
    self.Instances[instance] = nil
end

function Component:Get(instance)
    return self.Instances[instance]
end

function Component:Has(instance)
    return self.Instances[instance] ~= nil
end

return Component
