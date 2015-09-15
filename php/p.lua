
local _debug = true

make_rat = function (numer,denom)
	return {numer,denom}
end

numer = function (rat)
	return rat[1]
end


denom = function (rat)
	return rat[2]
end



p_rat = function(rat)
	-- return io.write(numer(rat),'/',denom(rat))
	return io.write(numer(rat),'/',denom(rat),"\n")
end



---------


one_half = make_rat(1,2)

p_rat(one_half)
one_half = make_rat(2,4)
p_rat(one_half)
gcd = function(a,b)
	
	if a < b then
		a,b = b,a
	end
	-- print(a,b)
	local _gcd
	_gcd = function(a,b)
		if _debug then 
			print(a,b)
		end

		local _mod = a % b
		-- print(_mod)
		-- os.exit()
		-- return _mod and _gcd(b,_mod) or b
		return _mod ~= 0 and _gcd(b,_mod) or b
	end
	-- todo
	-- a > b 
	return _gcd(a,b)

end

-- print(gcd(2,3))


make_rat = function(numer,denom)
	local _gcd_value = gcd(numer,denom)
	-- print(gcd)
	return {numer/_gcd_value,denom/_gcd_value}
end


one_half = make_rat(2,4)

p_rat(one_half)




add_rat = function(rat1,rat2)
	--todo
	return make_rat( numer(rat1) * denom(rat2) + numer(rat2) * denom(rat1) , denom(rat1) * denom(rat2))
end

sub_rat = function(rat1,rat2)
	return make_rat( numer(rat1) * denom(rat2) - numer(rat2) * denom(rat1) , denom(rat1) * denom(rat2))
end

mul_rat = function(rat1,rat2)
	--todo
	return make_rat(numer(rat1) * numer(rat2), denom(rat1) * denom(rat2))
end

div_rat  = function(rat1,rat2)
	--todo
	return make_rat(numer(rat1) *  denom(rat2),numer(rat2) * denom(rat1))
end



one_half = make_rat(2,4)
one_3 =make_rat(1,3)
p_rat(add_rat(one_half,one_3))
p_rat(mul_rat(one_half,one_3))
p_rat(sub_rat(one_3,one_half))
p_rat(div_rat(one_half,one_3))
