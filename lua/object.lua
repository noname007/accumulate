Account = {balance=1000}

function Account.withdraw(Account,amount)
	Account.balance = Account.balance - amount
	return Account
end

a = Account

print(a,Account)
-- Account = nil           
print(a.withdraw(a,19).balance,Account)
print(a:withdraw(100).balance)
print(a:withdraw(100).balance)


AccountBlacne = {}
require 'ulity'
setmetatable(AccountBlacne,{__index=Account, dda = 1})
var_dum(getmetatable(AccountBlacne))
--TODO var_dum 显示不出来__index
-- print(AccountBlacne.balance)
k = {}
print(k)
k = {}
print(k)






