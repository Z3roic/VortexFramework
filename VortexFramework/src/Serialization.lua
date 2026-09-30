local Serialization = {}

function Serialization.Encode(value)
    local kind = type(value)
    if kind == "nil" or kind == "boolean" or kind == "number" or kind == "string" then
        return {Type = kind, Value = value}
    end
    if kind == "table" then
        local result = {}
        for key, item in pairs(value) do
            result[#result + 1] = {Key = Serialization.Encode(key), Value = Serialization.Encode(item)}
        end
        return {Type = "table", Value = result}
    end
    error("Unsupported serialization type: " .. kind)
end

function Serialization.Decode(value)
    if value.Type ~= "table" then return value.Value end
    local result = {}
    for _, item in ipairs(value.Value) do
        result[Serialization.Decode(item.Key)] = Serialization.Decode(item.Value)
    end
    return result
end

return Serialization
