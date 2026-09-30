local TableUtil = {}

function TableUtil.Copy(value, deep)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, item in pairs(value) do
        result[key] = deep and TableUtil.Copy(item, true) or item
    end
    return result
end

function TableUtil.Merge(...)
    local result = {}
    for _, source in ipairs({...}) do
        for key, value in pairs(source) do result[key] = value end
    end
    return result
end

function TableUtil.Map(source, callback)
    local result = {}
    for key, value in pairs(source) do result[key] = callback(value, key) end
    return result
end

function TableUtil.Filter(source, callback)
    local result = {}
    for key, value in pairs(source) do
        if callback(value, key) then result[key] = value end
    end
    return result
end

return TableUtil
