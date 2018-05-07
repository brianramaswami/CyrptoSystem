def decrypt_elgamal(cipher_array, A):
	plain_num = cipher_array[1] / cipher_array[0] ^ A
	return plain_num

def elgamal(msg_num, p, a, A, B):
	if (msg_num < p):
		k = randint(1, p)
		cipher_txt = [a^k, B^k*msg_num]
		print("Cipher text: [" + str(cipher_txt[0]) + ", " + str(cipher_txt[1]) + "] P: " + str(p) + " primitive root: " + str(primitive_root(p)))
		print("Decrypted: " + str(decrypt_elgamal(cipher_txt, A)))
	else:
		print("String is too long.")

def createAandB(m, p, a):
	A = randint(1, p)
	B = mod(a ^ A, p)
	while (B != 4071):
		A = randint(1, p)
		B = mod(a ^ A, p)
	print("A: " + str(A) + ", B = " + str(B))

def signature(m, p, a, A, B):
	k = randint(1, p)
	r = mod(a^k, p)
	s = mod(((m - A * r)/k), (p-1))
	print("s = " + str(s) + ", r = " + str(r))
	checkSignature(m, p, a, B, r, s)

def checkSignature(m, p, a, B, r, s):
	part1 = mod(a^m, p)
	part2 = mod(B ^ r * r ^ s, p)
	print("part 1: " + str(part1) + ", part 2: " + str(part2))
