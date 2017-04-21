-- 
-- 
-- 
-- ref https://moonbingbing.gitbooks.io/openresty-best-practices/lua/FFI.html
-- 
-- https://github.com/openresty/lua-resty-lrucache/blob/master/lib/resty/lrucache/pureffi.lua
-- 
local ffi = require "ffi"
local myffi =  ffi.load('./libhello.so',true)




ffi.cdef [[
    typedef struct {int a;}foo_t;
    int printf(const char * fmt,...);
    int add(int x, int y);
]]

--  must after ffi.cdef to deaclare the printf func
ffi.C.printf("hello world i am c function \n")


local res = myffi.add(1,2)



print(res)

--  now work in  openresty-1.11.2.2-win32
--  
-- ffi.load('./libhello.so',true)
-- print(ffi.C.add(2,3))
-- 
-- 

local uint_t = ffi.typeof('unsigned int')

print(type(uint_t),uint_t)



-- ffi.new == ffi.C.malloc ffi.gc() ffi.C.free
-- 


local hello = 'hello world'

local c_str_t  = ffi.typeof('const char *')
local c_str = ffi.cast(c_str_t,hello)
ffi.C.printf("%s\n",c_str)
-- equal with above 
ffi.C.printf("%s\n",hello)

print(ffi.cast(uint_t,c_str))
print(tonumber(ffi.cast(uint_t,c_str)))


local buflen = ffi.new("unsigned long[1]", 8)
print(buflen,buflen[0])






-- ffi.cast()