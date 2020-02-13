import time
start_time = time.time()

def isPrime(n):
    if n < 2: return False
    if n == 2: return True
    if not (n & 1): return False
    r = int(n ** 0.5)
    for i in range(2, r+1):
        if not (n % i): return False
    return True

n1 = 2000000000
n2 = 2010000000

total = 0

for i in range(n1, n2+1):
    if isPrime(i):
        total += 1

print('Total primes between {} and {}: {}'.format(n1,n2,total))
print("--- %s seconds ---" % (time.time() - start_time))