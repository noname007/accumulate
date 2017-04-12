
local _M = {}






--
-- 封装
--   属性 成员变量 方法 __index __newindex
--   访问权限
--                    外        子类    本类
--      public:        y         y       y        table key 即可以实现
--      protected      n         y       y        __index   __newindex  +  闭包
--      private        n         n       y        __index   __newindex  +  闭包
--      
-- 继承
--   单继承   
--   多继承
--   
-- 多态
--  覆盖   
--  重载
-- 
-- 
-- 



-- function _M:name()
--  print('hello world')
-- end

print(_M)
_M.__index = _M
setmetatable(_M,{
    __index=function (...)
       print("__index:",...)
       return _M
    end,
    -- __newindex=function( t,k,v)
    --     print('<---------------',t,k,v)
    --     print(debug.traceback())
    -- end,
    __call = function (...)
       -- body
       print("__call:",...)
    end
})
-- function _M:__call(...)

--  print(...)
-- end

return _M
