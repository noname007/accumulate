local _E = {}
local _T = _G


-- setmetatable(_E, {__index = _T})
setfenv(1, _E)

_T.print(_G)

-- var_dum()
-- setfenv(f, table)
-- for k,v in _T.pairs(_G) do
-- 	print(k,v)
-- end

-- print(package.path)
-- -- print(...)
-- print(type(package.cpath),package.cpath)
-- require 'love'
-- function love.draw()
-- love.graphics.print("Hello World!", 400, 300)
-- end