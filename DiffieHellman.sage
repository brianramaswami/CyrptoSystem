#Brian Ramaswami
#4/26/18

# USEFUL Resources (reminder) : https://hackernoon.com/algorithms-explained-diffie-hellman-1034210d5100

def DiffieHellman():
	# Variables Used
	sharedPrime = 23    # p (A LARGE PRIME NUMBER)
	sharedBase = 5      # g (A SMALLER PRIME NUMBER)
 
	aliceSecret = 6     # a (PICK ANY NUMBER)
	bobSecret = 15      # b (PICK ANY NUMBER)
 
	print( "Publicly Shared Variables (Everyone has access to these) :")
	print("Prime: " , sharedPrime )
	print("Base:  " , sharedBase )
 
	# Alice Sends Bob A = g^a mod p
	A = (sharedBase**aliceSecret) % sharedPrime
	print("Alice Sends Over Public Chanel her public key: " , A )
 
	# Bob Sends Alice B = g^b mod p
	B = (sharedBase ** bobSecret) % sharedPrime
	print("Bob Sends Over Public Chanel his private key: ", B )
 
	print( "\n------------\n" )
	print( "Privately Calculated Shared Secret:" )
	# Alice Computes Shared Secret: s = B^a mod p
	aliceSharedSecret = (B ** aliceSecret) % sharedPrime
	print("Alice Shared Secret: ", aliceSharedSecret )
 
	# Bob Computes Shared Secret: s = A^b mod p
	bobSharedSecret = (A**bobSecret) % sharedPrime
	print("Bob Shared Secret: ", bobSharedSecret )
	
	if aliceSharedSecret == bobSharedSecret:
		key = aliceSharedSecret;
		return key;


