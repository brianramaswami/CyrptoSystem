#Brian Ramaswami
#4/26/18

# USEFUL Resources (reminder) : https://hackernoon.com/algorithms-explained-diffie-hellman-1034210d5100

def DiffieHellman(p, g, a, B):
	# Variables Used
	sharedPrime =  p    #23    # p (A LARGE PRIME NUMBER)
	sharedBase =    g     #5      # g (A SMALLER PRIME NUMBER)(g <= p -1)
 
	aliceSecret =  a         #6     # a (PICK ANY NUMBER)
	#bobSecret = 15      # b (PICK ANY NUMBER)
 
	print( "Publicly Shared Variables (Everyone has access to these) :")
	print("Prime: " , sharedPrime )
	print("Base:  " , sharedBase )
 
	# Alice Sends Bob A = g^a mod p
	A = (sharedBase**aliceSecret) % sharedPrime
	print("Alice Sends Over Public Chanel her public key: " , A )
	
	return A;





def calculateKey(a,B,p);
 	
 	sharedPrime = p 
 	aliceSecret = a
 	
 	
	print( "\n------------\n" )
	print( "Privately Calculated Shared Secret:" )
	# Alice Computes Shared Secret: s = B^a mod p
	aliceSharedSecret = (B ** aliceSecret) % sharedPrime
	print("Alice Shared Secret: ", aliceSharedSecret )

	return aliceSharedSecret;



 '''
	# Bob Sends Alice B = g^b mod p
	B = (sharedBase ** bobSecret) % sharedPrime
	print("Bob Sends Over Public Chanel his private key: ", B )
 '''
 
 
 '''
	# Bob Computes Shared Secret: s = A^b mod p
	bobSharedSecret = (A**bobSecret) % sharedPrime
	print("Bob Shared Secret: ", bobSharedSecret )

'''