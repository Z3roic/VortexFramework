local Trove = {}
Trove.__index = Trove

function Trove.new()
    return setmetatable({Items = {}}, Trove)
end

function Trove:Add(item)
    self.Items[#self.Items + 1] = item
    return item
end

function Trove:Clean()
    for i = #self.Items, 1, -1 do
        local item = self.Items[i]
        if type(item) == "function" then item()
        elseif type(item) == "table" then
            if type(item.Destroy) == "function" then item:Destroy()
            elseif type(item.Disconnect) == "function" then item:Disconnect()
            elseif type(item.Cancel) == "function" then item:Cancel() end
        end
        self.Items[i] = nil
    end
end

function Trove:Destroy()
    self:Clean()
end

return Trove
