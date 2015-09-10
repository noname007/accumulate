
p = print

local mt ={}
local _t = {}
local mt_t  = {}

mt.__newindex = _t

mt_t.__newindex = function(t,k,v)
	print(t,k,v)
end

setmetatable(_t, mt_t)


local a = {1,2,3,4,6}
setmetatable(a, mt)


p('a ',a)
p('_t',_t)
a['string_key'] = 10
a[2] = 100
p (table.concat( a, ", " ))
--[[
输出结果：
-------------------
验证了：
@1.__newindex 如果为一个表，当调用这个则直接调用这张表的索引
@2.每个table都有不同的元表
-------------------
a 	table: 00000000003c9bd0
_t	table: 00000000003c9b50
table: 00000000003c9b50	string_key	10
1, 100, 3, 4, 6

--]]
