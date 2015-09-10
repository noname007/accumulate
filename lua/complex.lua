complex = {}
function complex.new(r,i)
	return {r = r , i = i}
end

function complex.add(c1,c2)
	return complex.new(c1.r + c2.r , c1.i + c1.i);
end

function complex.sub(c1,c2)
	return complex.new(c1.r - c2.r , c1.i - c2.i)
end

function complex.mul(c1 , c2)
	return complex.new(c1.r * c2.r - c1.i * c2.i, c1.r * c2.i + c1.i * c2.r)
end

local function inv(c)
	-- body
	local n = c.r^2 +c.i^2
	return complex.new(c.r / n , -c.i / n)
end

function complex .div(c1,c2)
	-- body
	return complex.mul(c1,inv(c2))
end

c1 = complex.new(1,1)
c2 = complex.new(2,2)

p = print

require 'ulity'
var_dum(complex.add(c1,c2))
var_dum(complex.sub(c1,c2))
var_dum(complex.mul(c1,c2))
var_dum(complex.div(c1,c2))