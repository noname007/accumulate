
local c = require("property")

local t = {}



c:name()

-- c:next()
-- 
-- 
setmetatable(t,c)

print(t)
t.name()

local a = t

print(a,t)

if a==t then
    print('========')
end