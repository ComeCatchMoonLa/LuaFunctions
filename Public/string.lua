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

-- 数字转字符串, 可设置保留几位小数, 以及是否影藏小数位末尾的0
_G.string.num2Str = function(num, precision, hideZero)
    if precision == nil then precision = 2 end
    if hideZero == nil then hideZero = false end

    if hideZero and num == 0 then return "0" end

    local str = ("%." .. precision .. 'f'):format(num)

    if hideZero and str:find('.') then
        local cnt = 0
        for i = #str, 1, -1 do
            if str:sub(i, i) == '0' then
                cnt = cnt + 1
            elseif str:sub(i, i) == '.' then
                cnt = cnt + 1
                break
            else
                break
            end
        end

        str = str:sub(1, #str - cnt)
    end

    return str
end

return {}
