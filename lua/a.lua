--[=========[
function main()
  print("Hello World")
end

main()


local str1 = 'hello world'
local str2 = "hello lua"
local str3 = [["add\name",'hello']]
local str4 = [=[string have a [[]].]=]

print(str1)    -->output:hello world
print(str2)    -->output:hello lua
print(str3)    -->output:"add\name",'hello'
print(str4)    -->output:string have a [[]].

local corp = {
    web = "www.google.com",   --索引为字符串，key = "web", value = "www.google.com"
    telephone = "12345678",   --索引为字符串
    staff = {"Jack", "Scott", "Gary"}, --索引为字符串，值也是一个表
    100876,              --相当于 [1] = 100876，此时索引为数字,key = 1, value = 100876
    100191,              --相当于 [2] = 100191，此时索引为数字
    [10] = 360,          --直接把数字索引给出
    ["city"] = "Beijing" --索引为字符串
}

print(corp.web)               -->output:www.google.com
print(corp["telephone"])      -->output:12345678
print(corp[2])                -->output:100191
print(corp["city"])           -->output:"Beijing"
print(corp.staff[1])          -->output:Jack
print(corp[10])               -->output:360

print(table.maxn == nil);

]]
]=========]


-- local days = {
--    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday","Sunday"
-- }

-- local revDays = {}
-- print(type(pairs(days)));
-- print(type(pairs(days)));
-- print(type(pairs(days)));
-- print((ipairs(days)));


-- for k, v in pairs(days) do
--   revDays[v] = k
-- end

-- -- print value
-- for k,v in pairs(revDays) do
--   print("k:", k, " v:", v)
-- end

-- require "table"
-- print(unpack({1,2,23,3,4},1,table.maxn(a)))
-- print(os.time());

-- t = setmetatable({[1] = "hello"}, {__index = {[2] = "world"}})
-- t = setmetatable(t,{__index= function(self,key)
--         print(key);
--         return "22222";
--     end })
-- print(t[1], t[2]) -->hello world


print('---------------add-------------------')

-- 可变参数
function add(...)
    local  sum = 0
    -- for k,v in ipairs{...} do
    local p = {...}     --> table
    -- print(type(p))
    for k,v in ipairs(p) do
        -- print(k,v)
        -- print(type(k),type(v))
        sum =sum + v
    end
    return sum
end
print(add(100,2,48934,12))

 
print('---------------minus-------------------')
minus  = function (...)
    local arg = {...}
    local a = ...
    -- print(type(a))
    -- print(a)
    arg.n = select('#',{...})
    -- print(arg)
    -- print(arg.n)
    return 1;
end

print(minus(1,2,3,4))

print('---------------sort-------------------')

order = {'a','b','f','e0','c','d'}

table.sort(order,function(a,b) return a>b end)

function var_dump(var)
    if type(var) == 'table' then
        -- print()
        for k,v in ipairs(var) do
            return 1
            -- return 'table',k,var_dump(v)
        end
    -- elseif type(var) == 'number' || type(var) == 'string',
    else
        return type(var),var
    end
end


fprint = function (...) 
    
end
fprint(type(var_dump(order)))


print('---------------iter-------------------')


a = {1,2,3,4,5,6}
function iter(set)
    local i = 0
    -- local set = 
    return function () 
            i = i + 1
            -- print(i)
            return set[i] 
        end
end
a_iter = iter(a);
a_iter()
print(type(function() return 1 end))
print(type(iter))
for i in a_iter do
    print(i)
end

print('---------------err-------------------')
local s,e = pcall(
    function ()
        a = "1" + 1
        print(debug.traceback())
        return a
    end)
print(s,"\n",e);
