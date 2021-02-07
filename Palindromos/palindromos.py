import math

nombreArchivo = input('Nombre del archivo: ')

try:
    with open(nombreArchivo, encoding="utf-8") as file:
        cont = 1
        for line in file:
            fraseLimpia = ''
            for letra in line:
                if letra.isalpha():
                    fraseLimpia += letra
            fraseLimpia = fraseLimpia.lower()
            fraseLimpia = fraseLimpia.replace('á', 'a').replace('é', 'e').replace('í', 'i').replace('ó', 'o').replace('ú', 'u')
            mitad = math.floor(len(fraseLimpia) / 2)
            valido = True
            for i in range(0, mitad):
                if fraseLimpia[i] != fraseLimpia[len(fraseLimpia) - 1 - i]:
                    valido = False
                    break
            if valido:
                print('Frase #', cont, ' es palíndromo')
            else:
                print('Frase #', cont, ' no es palíndromo')
            cont += 1
except:
    print('Error, el archivo', nombreArchivo, 'no existe')