local Inventory = {}
Inventory.__index = Inventory

function Inventory.new(capacity)
    return setmetatable({Capacity = capacity or 20, Items = {}}, Inventory)
end

function Inventory:Add(item, amount)
    self.Items[item] = (self.Items[item] or 0) + (amount or 1)
    return true
end

function Inventory:Remove(item, amount)
    amount = amount or 1
    local current = self.Items[item] or 0
    if current < amount then return false end
    current = current - amount
    if current == 0 then self.Items[item] = nil else self.Items[item] = current end
    return true
end

function Inventory:Get(item)
    return self.Items[item] or 0
end

function Inventory:Clear()
    self.Items = {}
end

return Inventory
