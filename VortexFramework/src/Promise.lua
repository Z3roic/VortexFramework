local Promise = {}
Promise.__index = Promise

function Promise.new(executor)
    local self = setmetatable({Status = "Pending", Value = nil, Reason = nil, Resolved = {}, Rejected = {}}, Promise)
    local function resolve(value)
        if self.Status ~= "Pending" then return end
        self.Status = "Resolved"
        self.Value = value
        for _, callback in ipairs(self.Resolved) do callback(value) end
    end
    local function reject(reason)
        if self.Status ~= "Pending" then return end
        self.Status = "Rejected"
        self.Reason = reason
        for _, callback in ipairs(self.Rejected) do callback(reason) end
    end
    local ok, err = pcall(executor, resolve, reject)
    if not ok then reject(err) end
    return self
end

function Promise:Then(callback)
    if self.Status == "Resolved" then callback(self.Value) else table.insert(self.Resolved, callback) end
    return self
end

function Promise:Catch(callback)
    if self.Status == "Rejected" then callback(self.Reason) else table.insert(self.Rejected, callback) end
    return self
end

return Promise
