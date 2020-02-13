import time
start_time = time.time()

def isPrime(n):
    if (n <= 1) : 
        return False
    if (n <= 3) : 
        return True
  
    if (n % 2 == 0 or n % 3 == 0) : 
        return False
  
    i = 5
    while(i * i <= n) : 
        if (n % i == 0 or n % (i + 2) == 0) : 
            return False
        i = i + 6
  
    return True

n1 = 2000000000
n2 = 2010000000

total = 0

for i in range(n1, n2+1):
    if isPrime(i):
        total += 1

print('Total primes between {} and {}: {}'.format(n1,n2,total))
print("--- %s seconds ---" % (time.time() - start_time))