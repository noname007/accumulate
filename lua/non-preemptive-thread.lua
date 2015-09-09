-- require 'socket'

-- 

-- assert()

-- a = ''

-- see what we want it express result
-- 参考{programming in lua 12 序列化}
function  var_dum( o )
	-- body
	if type(o) == 'number' then
		io.write(o)
		-- echo{}
		-- echo('nubmer',)
	elseif type(o) == 'string' then
		io.write('string => "',o,'"')
		-- io.write(string.format("%q",o))
	elseif type(o) == 'table' then
		io.write("table {\n")
		-- io.write(tostring(o))
		for k,v in pairs(o) do
			-- print(k,v)
			-- var_dum()
			io.write('[',k,'] = ')
			var_dum(v)
			io.write("\n")
		end
		io.write("}\n")
	else
		error('dont know type')
	end
end

-- function echo(fmt,...)
-- 	-- body
-- 	-- print()
-- 	-- print(...)
-- 	print(string.format(fmt,...))
-- end

-- echo('1,dfa2,2,3,3,4,5,%d,%d,%d,',6,7,8,9,10)

-- a = '1\\'
-- var_dum({1,2,3,4,})
-- print('')
-- print(tostring(1))


var_dum({1,2,34,5,6,web = {12,2,3,4,5}})

