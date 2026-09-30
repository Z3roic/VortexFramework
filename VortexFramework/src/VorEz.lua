local VorEz = {}
VorEz.__index = VorEz

function VorEz.new(transport)
    return setmetatable({
        Transport = transport,
        Events = {},
        Functions = {},
        EventIds = {},
        NextId = 0
    }, VorEz)
end

function VorEz:RegisterEvent(name)
    assert(type(name) == "string", "event name must be a string")

    if self.Events[name] then
        return self.Events[name]
    end

    local event = {
        Name = name,
        Id = self.NextId
    }

    self.NextId = self.NextId + 1
    self.Events[name] = event
    self.EventIds[event.Id] = event

    return event
end

function VorEz:RegisterFunction(name, callback)
    assert(type(name) == "string", "function name must be a string")
    assert(type(callback) == "function", "callback must be a function")
    self.Functions[name] = callback
end

function VorEz:Fire(name, ...)
    if self.Transport and type(self.Transport.Fire) == "function" then
        return self.Transport:Fire(name, ...)
    end
end

function VorEz:Invoke(name, ...)
    if self.Transport and type(self.Transport.Invoke) == "function" then
        return self.Transport:Invoke(name, ...)
    end
end

function VorEz:Handle(name, ...)
    local callback = self.Functions[name]
    if not callback then
        error("Unknown VorEz function: " .. tostring(name))
    end
    return callback(...)
end

function VorEz:GetEvent(name)
    return self.Events[name]
end

function VorEz:GetEventById(id)
    return self.EventIds[id]
end

function VorEz:RemoveEvent(name)
    local event = self.Events[name]
    if event then
        self.EventIds[event.Id] = nil
        self.Events[name] = nil
    end
end

return VorEz
