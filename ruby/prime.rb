# Math::sqrt()
# ------------n^2----------------------
# prime = 0
# 
# 899808659.downto(899808659) { |a|
# 	p a
# 	2.upto(Math::sqrt(a).to_i){|b|
# 		# p b
# 		if a % b
# 			next;
# 		end
# 		prime = a
# 		break

# 	}
# 	if prime != 0
# 		break
# 	end
# }
 # map_prime = Hash.new(10,0)

def range_899808659
	i = 2
	while i < 899808659
		yield(i)
		i = i+1
	end
end


def range(s,e,step = 1)
	
	while s < e
		yield(s)
		s += step
	end
end


# prime = {'2'=>true,'3'=>'true'}

# not_prime = 

# p 'nil' if prime['3'] == nil 
# Array.append()



# a = prime.push(1)
# p a.pop
# p prime
is_prime = Array.new(100000000,1)
prime = []
# p is_prime
# find prime in 100
# range(2,100) do|a|
	
# 	# prime[a]
# end

i = 2
# num = 899808659
num = 100000000
while i < num do
	

	prime.push(i) if is_prime[i] == 1
	# p i
	prime.each do|a| 
		# print i,' ',a,' ',i*a ,"\n"
		break if i*a >= num
		is_prime[i*a] = 0
		break if i%a == 0
	end
	i += 1;
	# p ' '
	# exit
	# p prime
	# exit
end

# p is_prime
# p prime
 
 # p map_prime
p prime.size

# 2.upto(10) { |n|  p n }
# 
# p Math::sqrt(10).to_i

# p 10% 3
# if 10%2
# 	p 'dddddd'
# end


# range(1,20){|a| print a,' '}
# 
# p 'aaaaaaaaaaaaa' if []