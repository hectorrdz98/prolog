
regulars = []
irregulars = []

allConjugations = {
    'ar': [
        'o', 'as', 'a', 'amos', 'áis', 'an'
    ],
    'er': [
        'o', 'es', 'e', 'emos', 'éis', 'en'
    ],
    'ir': [
        'o', 'es', 'e', 'imos', 'ís', 'en'
    ]
}

with open('regulars.txt', encoding="utf-8") as file:
    regulars = [ [ x for x in line.split(',') ][0:7] for line in file ]

with open('irregulars.txt', encoding="utf-8") as file:
    irregulars = [ [ x for x in line.split(',') ][0:7] for line in file ]

def newRegularVerb(verb):
    prefix = verb[:len(verb)-2]
    termination = verb[len(verb)-2:]
    if termination in allConjugations:
        conjugations = allConjugations[termination]
        verbConj = [verb]
        for conj in conjugations:
            verbConj.append(prefix + conj)
        return verbConj
    else:
        return None

def existsInFiles(verb):
    for reg in regulars:
        if reg[0] == verb: 
            printLine(len(verb) + 10)
            print('\n{} (regular)'.format(verb))
            printLine(len(verb) + 10)
            return reg
    for irreg in irregulars:
        if irreg[0] == verb: 
            printLine(len(verb) + 12)
            print('\n{} (irregular)'.format(verb))
            printLine(len(verb) + 12)
            return irreg
    return None

def printLine(l):
    for _ in range(l):
        print('-', end='')

def printConjs(values):
    print('Yo:', values[1])
    print('Tú:', values[2])
    print('Ella/Él:', values[3])
    print('Nosotros:', values[4])
    print('Vosotros:', values[5])
    print('Ustedes/Ellos:', values[6])

def main():
    print('\nVerb: ', end='')
    verb = input()

    conj = existsInFiles(verb)
    newVerb = False

    if not conj:
        conj = newRegularVerb(verb)
        newVerb = True
    if conj:
        print('')
        printConjs(conj)
        if newVerb:
            print('\n¿Es correcto? ', end='')
            if input() == 'y':
                with open('regulars.txt', 'a+', encoding="utf-8") as file:
                    file.writelines('%s,' % c for c in conj)
                    file.writelines('\n')
            else:
                irreg = [verb] 
                print('\nYo: ', end='')
                irreg.append(input())
                print('Tú: ', end='')
                irreg.append(input())
                print('Ella/Él: ', end='')
                irreg.append(input())
                print('Nosotros: ', end='')
                irreg.append(input())
                print('Vosotros: ', end='')
                irreg.append(input())
                print('Ustedes/Ellos: ', end='')
                irreg.append(input())
                with open('irregulars.txt', 'a+', encoding="utf-8") as file:
                    file.writelines('%s,' % c for c in irreg)
                    file.writelines('\n')
    else: print('Not valid verb')
    print()

main()