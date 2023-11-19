-- random
-- version: 1.0
-- by: CatchMoon

---@diagnostic disable-next-line: param-type-mismatch
math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --设置时间种子

-- 在范围内随机, 根据a/b的类型决定随机数的类型
_G.Random.Range = function(a, b)
    if _G.math.isInt(a) and _G.math.isInt(b) then
        return math.random(a, b)
    else
        return a + math.random() * (b - a)
    end
end

-- 在2者之间随机, 这2者可以是任意值
_G.Random.EitherOr = function(v1, v2)
    if math.random(2) == 1 then
        return v1
    else
        return v2
    end
end

-- 在圆上随机一个点的坐标(x, y)
_G.Random.OnUnitCircle = function(radius)
    local randomRad = math.random(0, 2 * math.pi)
    return math.cos(randomRad) * radius, math.sin(randomRad) * radius
end

-- 在圆内随机一个点的坐标(x, y)
_G.Random.InsideUnitCircle = function(radius)
    local randomRad = math.random(0, 2 * math.pi)
    local randomDist = math.random() * radius
    return math.cos(randomRad) * randomDist, math.sin(randomRad) * randomDist
end

-- 根据权重(概率)随机
_G.Random.ValueByWeight = function(valueInfoList, valueKey, weightKey)
    local weightSum = 0

    for _idx, valueInfo in ipairs(valueInfoList) do
        weightSum = weightSum + valueInfo[weightKey]
    end
    local rollWeight = math.random() * weightSum
    local curWeight = 0
    for _idx, valueInfo in ipairs(valueInfoList) do
        curWeight = curWeight + valueInfo[weightKey]
        if curWeight > rollWeight then
            return valueInfo[valueKey]
        end
    end
end

return {}
