local VorEz = require(script.Parent.Parent.src.VorEz)

local transport = {}

function transport:Fire(name, ...)
    return name, ...
end

function transport:Invoke(name, ...)
    return name, ...
end

local Network = VorEz.new(transport)
Network:RegisterEvent("GameEvent")
Network:RegisterFunction("Ping", function(value)
    return value
end)

return Network
