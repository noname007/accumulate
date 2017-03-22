
function s( a,...)
	-- body
	print(a,...)


	local t = {...}
	-- local t = {
	-- 	[1] = "test1",
	-- 	[4] = "test1",
	-- 	[5] = "test1"
	-- }

	for i,v in ipairs(t) do
		print(i,v)
	end

	print('---------------------------')
	for k,v in pairs(t) do
		print(k,v)
	end
	print('---------------------------')

	for i=1,#t do
		print(i,t[i])
	end
	print('---------------------------')

	for i=1,select("#",...) do
		print(i,select(i,...))
	end



end

s(1,1,2,3,4,nil,6,7,8)

