
entrada = input()
separado = entrada.split(' ')

n1 = int(separado[0])
n2 = int(separado[1])
maxL = 0

def obtenerLongitud(n):
    l = 1
    while n > 1:
        l += 1
        if n % 2 == 0:
            n = n / 2
        else:
            n = (n * 3) + 1
    return l

for i in range(n1, n2 + 1):
    l = obtenerLongitud(i)
    if l > maxL:
        maxL = l

print(n1, n2, maxL)