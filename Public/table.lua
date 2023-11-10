-- table.pack(...)
_G.table.pack = function(...)
    return { n = select("#", ...), ... }
end

-- 合并2个表, 若键值冲突则t2的值将会覆盖t1中的值
_G.table.merge = function(t1, t2)
    for key, value in pairs(t2) do
        if type(value) == "table" and type(t1[key]) == "table" then
            -- 递归合并子表
            _G.table.merge(t1[key], value)
        else
            -- 直接赋值
            t1[key] = value
        end
    end
    return t1
end

-- 深拷贝
_G.table.copy = function(t)
    local copy
    if type(t) == "table" then
        copy = {}
        for key, value in pairs(t) do
            copy[key] = _G.table.copy(value)
        end
    else
        copy = t
    end
    return copy
end

-- 通过键找值
_G.table.findValueByKey = function(table, key)
    local function findValueByKeyRecursive(table, key, level)
        level = level or 1
        for k, v in pairs(table) do
            if k == key then
                return v, level
            elseif type(v) == "table" then
                local result, resultLevel = findValueByKeyRecursive(v, key, level + 1)
                if result then
                    return result, resultLevel
                end
            end
        end
        return nil, 0
    end
    return findValueByKeyRecursive(table, key)
end

-- 通过值找键
_G.table.findKeyByValue = function(table, value)
    local function findKeyByValueRecursive(table, value, level)
        level = level or 1
        for k, v in pairs(table) do
            if v == value then
                return k, level
            elseif type(v) == "table" then
                local result, resultLevel = findKeyByValueRecursive(v, value, level + 1)
                if result then
                    return result, resultLevel
                end
            end
        end
        return nil, 0
    end
    return findKeyByValueRecursive(table, value)
end

-- 获取长度(只统计第1层, 涵盖字符串索引)
_G.table.getLen = function (t)
    local len = 0
    for _, _ in pairs(t) do
        len = len + 1
    end
end

return {}
