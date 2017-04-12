local co =coroutine.create(function ( ... )
	-- coroutine.yield(1,2,3,4,5,6,7,8,9)
	print(...)
	local co = function ()
		print('-----------------')
		coroutine.yield(1,2,3,4)
		print('-========12344======-=')
	end

	error('1fasfsfasf')
	co()
	print('-==============-=')
	return 1;
end)

local r,r1,r2,r3,r4,r5,r6 = coroutine.resume(co,6,7,8,9)

print('main =========>>>>>',r,r1,r2,r3,r4,r5,r6 )

local r,r1,r2,r3,r4,r5,r6 = coroutine.resume(co,6,7,8,9)
print('main =========>>>>>',r,r1,r2,r3,r4,r5,r6 )