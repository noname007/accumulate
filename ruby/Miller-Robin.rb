# p rand()
# rand()
# 
# 
# 



# n - 1 = d*2^r  二次探测定理
# a^(n-1) mod n = 1
# 
# 
# def check
# 


def mult_mod(a,b,n)
	((a % n )* (b % n)) % n
end

# a^x % n
def pow_mod(a,x,n)

	# return a ^x %n  lib func may be work
	# return
	return a % n if n == 1 
	ret = 1
	tmp = a

	# mut_control = 0b1 & x

	while x != 0
		# p x
		ret = mult_mod(ret,tmp,n) if (0b1 & x)== 1  
		tmp = mult_mod(tmp,tmp,n)
		x >>= 1
	end

	ret
end

# 
def check_one_pass_is_prime(a,n,x,r)
	ret = pow_mod(a,x,n)
	last = ret
	1.upto(r) do |t|
		ret = mult_mod(ret,ret,n)

		return false if(ret == 1 && last != 1 && last != (n - 1))

		last = ret

	end

	return true if ret == 1
	false
end



# p  mult_mod(1000000,10000000000000001,1000000000000000)

# 
# p  pow_mod(3,4,8)
# p  5>>1
def miller_rabin n
	
	x = n - 1;

	r = 0
	while x&1 == 0
		x >>=1
		r+= 1
	end

	1.upto(20) do |t| 
		# p
		a = rand(2..n)
		return false if !check_one_pass_is_prime(a,n,x,t)
	end

	true
end
# p  x,r
n = 899808659;
n.downto(899808619){|n| p n if miller_rabin(n)}
n = 899808619
# 899808641
899808618.upto(899808659) { |n| 
	is_prime = true
	2.upto(Math::sqrt(n).to_i) { |t|  
		if n % t == 0 
			is_prime = false
			break
		end
	}
	p n if is_prime
}

