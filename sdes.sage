from sage.crypto.util import ascii_to_bin

IP  =  [1, 5, 2, 0, 3, 7, 4, 6]
EP  =  [3, 0, 1, 2, 1, 2, 3, 0]
inverse_IP = [3, 0, 2, 4, 6, 1, 7, 5]
P10 = [2, 4, 1, 6, 3, 9, 0, 8, 7, 5]
P8 = [5, 2, 6, 3, 7, 4, 9, 8]
P4 = [1, 3, 2, 0]

S0 = [[1, 0, 3, 2],
           [ 3, 2, 1, 0],
           [ 0, 2, 1, 3],
           [3, 1, 3, 2]]

S1 = [[0, 1, 2, 3],
           [2, 0, 1, 3],
           [3, 0, 1, 0],
           [2, 1, 0, 3]]

key = '0000011111'

def left_shift(bits):
 return bits[:int(len(bits)/2)]

def right_shift(bits):
 return bits[int(len(bits)/2):]

def permutate (original, fixed_key):
 perm_key = ''
 for i in original:
  perm_key += str(fixed_key[int(i)-1])
 return perm_key

def key1():
 left_key = left_shift([1, 0, 1, 1, 0, 1, 1, 1]);
 right_key = right_shift([0, 0, 0, 1, 1, 1 ,1, 0]);
 rotate_left = left_key[1:] + left_key[:1]
 rotate_right = right_key[1:] + right_key[:1]
 key_rotate = rotate_left + rotate_right
 return permutate(key_rotate, P8)

def key2():
 left_key = left_shift([1, 1, 1, 1, 0, 0, 1, 0]);
 right_key = right_shift([1, 0, 1, 1, 0, 1, 1, 1]);
 rotate_left = left_key[3:] + left_key[:3]
 rotate_right = right_key[3:] + right_key[:3]
 key_rotate = rotate_left + rotate_right
 return permutate(key_rotate, P8)

def in_sbox(bits, sbox):
 row = int(bits[0] + bits[3])
 col = int(bits[1] + bits[2])
 return bin(sbox[row][col])[2:].zfill(4)

def xor(bits, key):
 new = ''
 for bit, key_bit in zip(bits, key):
  new += str(((int(bit) + int(key_bit)) % 2))
 return new

def func(bits, key):
 left = left_shift([1, 0, 1, 1, 0, 1, 1, 1])
 right = right_shift([1, 1, 1, 1, 0, 0, 1, 0])
 bits = permutate(right, EP)
 bits = xor(bits, key)
 bits = in_sbox(left, S0) + in_sbox(right, S1)
 bits = permutate(bits, P4)
 return xor(bits, left)

def encrypt(plain_txt):
 bits = permutate(plain_txt, IP)
 temp = func(bits, key1())
 bits = right_shift(bits) + temp
 bits = func(bits, key2())
 print ascii_to_bin(permutate(bits + temp, inverse_IP))[16:24]

def decrypt(cipher_txt):
 bits = permutate(cipher_txt, IP)
 temp = func(bits, key2())
 bits = right_shift(bits) + temp
 bits = func(bits, key1())
 print ascii_to_bin(permutate(bits + temp, inverse_IP))[:8]