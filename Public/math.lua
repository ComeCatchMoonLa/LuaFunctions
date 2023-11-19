-- <math>
-- version: 1.2
-- by: CatchMoon

-- 四舍五入取整, 可指定保留几位小数
_G.math.round = function(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- 将数字的值限制在[min, max]
_G.math.clamp = function(num, min, max)
    if num < min then
        return min
    elseif num > max then
        return max
    else
        return num
    end
end

-- 将数字的值限制在[0, 1]
_G.math.clamp01 = function(num)
    return math.clamp(num, 0, 1)
end

-- 获取一个数的符号
_G.math.sign = function(num)
    if num < 0 then
        return -1
    elseif num > 0 then
        return 1
    else
        return 0
    end
end

-- 对数字进行插值
_G.math.lerp = function(a, b, t)
    return a + (b - a) * t
end

-- 对数字进行插值(但限制该值在[0,1]区间)
_G.math.lerp01 = function(a, b, t)
    return math.lerp(a, b, math.clamp(t, 0, 1))
end

-- 计算两个给定角度(以度为单位给定)之间的最短差异
_G.math.deltaAngle = function(angle1, angle2)
    local diff = (angle1 - angle2) % 360
    return math.min(diff, 360 - diff)
end

-- 与math.lerp相同，但是在值环绕360°时确保值正确插入。
_G.math.lerpAngle = function(angle1, angle2, t)
    local deltaAngle = (angle2 % 360) - (angle1 % 360)
    if deltaAngle > 180 then t = -t end
    return math.lerp(angle1, angle2, t)
end

-- 判断该数是否为整数
_G.math.isInt = function(n)
    return type(n) == "number" and math.floor(n) == n
end

return {}
