-- 可以打印表的完整内容, 也可以打印其它数据. 但是不能打印多个参数(会被当做一个数table理)
_G.Print = function(...)
    local function HelperFunction(data, indent)
        indent = indent or 0
        local indentStr = string.rep("| ", indent)
        if type(data) == "table" then
            for k, v in pairs(data) do
                if type(v) == "table" then
                    print(indentStr .. indentStr .. k .. ':')
                    HelperFunction(v, indent + 1)
                else
                    print(indentStr .. k .. ": " .. tostring(v))
                end
            end
        else
            print(indentStr .. tostring(data))
        end
    end
    local datas = { ... }
    for _, data in pairs(datas) do
        HelperFunction(data)
    end
end

return {}
