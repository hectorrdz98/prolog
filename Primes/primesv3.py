import math

def isPrime(n):
    if n == 2: return True
    if n % 2 == 0: return False
    upper_lim = int(math.sqrt(n)) + 1
    # check odd numbers from 3 to sqrt(n)
    return len([i for i in range(3, upper_lim, 2) if n % i == 0]) == 0

n1 = int(input())
n2 = int(input())

total = 0

for i in range(n1, n2+1):
    if isPrime(i):
        total += 1

print('Total primes between {} and {}: {}'.format(n1,n2,total))