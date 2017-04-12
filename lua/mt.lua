local  mt = {}

function Set()
	local t = {}
	setmetatable(t,mt)
	return t;
end

mt.__concat = function( ... )
	-- body
	print(...)
	local t = {...}

	return t[2]
end


local s = Set()
print(s)

print(s.."111"..s..'222')
print("111"..s..'222')


