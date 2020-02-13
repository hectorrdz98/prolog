def isPrime(n):
    for i in range(2, n):
        if n % i == 0:
            return False
    return True


n1 = int(input())
n2 = int(input())

total = 0

for i in range(n1, n2+1):
    if isPrime(i):
        total += 1

print('Total primes between {} and {}: {}'.format(n1,n2,total))
