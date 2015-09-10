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
	elseif type(o) == 'function' then
		io.write('function')
	else
		error('dont know type')
	end
end