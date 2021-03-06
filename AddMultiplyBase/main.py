
def dec_to_base(num, base):
    base_num = ""
    while num > 0:
        dig = int(num % base)
        if dig < 10:
            base_num += str(dig)
        else:
            base_num += chr(ord('A') + dig - 10)
        num //= base

    base_num = base_num[::-1]
    return base_num

base = int(input('Base: '))

valor1 = input('Valor 1: ')
valor2 = input('Valor 2: ')

valor1Dec = int(valor1, base=base)
valor2Dec = int(valor2, base=base)

suma = valor1Dec + valor2Dec
producto = valor1Dec * valor2Dec

sumaBase = dec_to_base(suma, base)
productoBase = dec_to_base(producto, base)

print('Suma: {}'.format(sumaBase))
print('Producto: {}'.format(productoBase))