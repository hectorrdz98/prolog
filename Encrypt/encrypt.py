
def xor(s1, s2):
    return chr(ord(s1) ^ ord(s2))

key = 'ABC'
index = 0

print('Input file name: ', end='')
nameInput = input()
print('Output file name: ', end='')
nameOutput = input()

output = open(nameOutput, 'w')

with open(nameInput) as file:
    for line in file:
        for c in line:
            output.write(xor(c, key[index]))
            index = index + 1 if index + 1 < len(key) else 0

output.close()