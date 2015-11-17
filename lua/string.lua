

function  trim(str)
	-- return string.gsub(str,'^%s*(.-)%s*$','%1')
	-- return (string.gsub(str,'^%s*(.-)%s*$','%1')) ---> 无法删除末尾的空白字符
	return (string.gsub(str,'^%s*(.-)%s*$','%1'))  ---》舍弃第二个返回值
end

p = print


p(trim(' dfdfad ddd '))


function latex2xml(str)
	return string.gsub(str,"\\(%a+)(%b{})",function (tag,body)
		body = string.sub(body,2,-2)
		body = latex2xml(body)
		return string.format("<%s>%s<%s>",tag,body,tag)
	end)
end

p((latex2xml("\\title{the \\bold{big} example}")))

a = 'hello'
b = 'world'
print(a..b)
-- io.read()