def elgamal2(msg):
	p = next_prime(2^3)
	a = mod(primitive_root(p), p)
	A = randint(1, p)
	B = mod(a ^ A, p)
	print("public info: p: " + str(p) + ", a: " + str(a) + ", B: " + str(B))
	k = randint(1, p - 1)
	while(gcd(k, p - 1) != 1):
		k = randint(1, p - 1)
	r = mod(a^k, p)
	s = mod((msg - A * r)/k, p - 1)
	print ("m: " + str(msg) + ", r: " + str(r) + ", s: " + str(s))
	elgamalverify(msg, r, s, p, a, B)

def elgamalverify(m, r, s, p, a, B):
	
	print(r < p)
	if (r < p):
		if (a ^ m == B ^ r * r ^ s):
			print("Signature Accepted")
		else:
			print("Signature Declined")
	else:
		print(r)
		print(p)
		print("Signature Declined. r !< p")
