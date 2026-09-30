local DataStore = {}
DataStore.__index = DataStore

function DataStore.new()
    return setmetatable({Data = {}}, DataStore)
end

function DataStore:Get(key, default)
    local value = self.Data[key]
    if value == nil then return default end
    return value
end

function DataStore:Set(key, value) self.Data[key] = value end
function DataStore:Remove(key) self.Data[key] = nil end
function DataStore:Clear() self.Data = {} end

return DataStore
