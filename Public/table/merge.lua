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