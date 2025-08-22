
function add(a, b)
    return a + b
end

local fruits = {
    (function() return string.char(97)..string.char(112)..string.char(112)..string.char(108)..string.char(101) end)(),
    (function() return string.char(98)..string.char(97)..string.char(110)..string.char(97)..string.char(110)..string.char(97) end)(),
    (function() return string.char(99)..string.char(104)..string.char(101)..string.char(114)..string.char(114)..string.char(121) end)()
}

for i, fruit in ipairs(fruits) do
    print((function() return string.char(27700)..string.char(26524)..string.char(32)..string.char(35) end)() .. i .. (function() return string.char(58)..string.char(32) end)() .. fruit)
end

function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

print((function() return string.char(53)..string.char(30340)..string.char(38454)..string.char(20056)..string.char(26159)..string.char(58)..string.char(32) end)() .. factorial(5))

function outer()
    local x = 10

    function inner()
        return x
    end

    return inner
end

local closure = outer()
print((function() return string.char(38381)..string.char(21253)..string.char(36820)..string.char(22238)..string.char(20540)..string.char(58)..string.char(32) end)() .. closure())

local mt = {
    __add = function(a, b)
        return { value = a.value + b.value }
    end
}

local num1 = { value = 5 }
local num2 = { value = 10 }

setmetatable(num1, mt)
setmetatable(num2, mt)

local result = num1 + num2
print((function() return string.char(20803)..string.char(34920)..string.char(21152)..string.char(27861)..string.char(32467)..string.char(26524)..string.char(58)..string.char(32) end)() .. result.value)