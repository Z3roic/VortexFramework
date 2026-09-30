local Signal = {}
Signal.__index = Signal

function Signal.new()
    return setmetatable({_connections = {}}, Signal)
end

function Signal:Connect(callback)
    assert(type(callback) == "function", "callback must be a function")
    local connection = {Connected = true, _owner = self, _callback = callback}
    function connection:Disconnect()
        if not self.Connected then return end
        self.Connected = false
        for i, item in ipairs(self._owner._connections) do
            if item == self then table.remove(self._owner._connections, i) break end
        end
    end
    table.insert(self._connections, connection)
    return connection
end

function Signal:Fire(...)
    for _, connection in ipairs(self._connections) do
        if connection.Connected then connection._callback(...) end
    end
end

function Signal:Destroy()
    for _, connection in ipairs(self._connections) do connection.Connected = false end
    self._connections = {}
end

return Signal
