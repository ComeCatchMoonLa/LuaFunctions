-- string.split
_G.string.split = function(str, delimiter)
    local result = {}
    local pattern = "(.-)" .. delimiter
    local lastPos = 1
    for part in str:gmatch(pattern) do
        result[#result + 1] = part
        lastPos = lastPos + #part + 1
    end
    result[#result + 1] = str:sub(lastPos)
    return result
end

return {}
