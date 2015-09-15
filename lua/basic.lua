a = "a line";b = "another line"
print(a,b)
print(a .. b)
print(#a,#'hello')
t = {"word",web = "good",'hello',he="dd",good,"word","word","word","word"}
for k,v in pairs(t) do
	print(k,v)
end

print(table.maxn(t))
print(t)

print(math.pi %  0.02)
print(math.pi - math.pi % 0.02)


x = 10
local i = 1
while i <= x do
	local x = i*2
	-- print(x)
	io.write(x," ")
	i = i + 1
end

io.write("\n")

if i > 20 then
	local x
	x = 20 
	print(x)
else 
	print(x)
end
