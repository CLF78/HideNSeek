cat = input("Category name: ")
sym = input('Symbol name: ')
addresses = input('Addresses: ').replace('0x', '').upper().split(', ')
regions = ['p', 'e', 'j', 'k']

for i, region in enumerate(regions):
    with open('rmc{}.ld'.format(region), 'r+') as f:
        data = f.read().splitlines()
        line = len(data) - 2

        if cat:
            data[line] += '\n\n\t/* ' + cat + ' */'

        data[line] += '\n\t{} = 0x{};'.format(sym, addresses[i] if int(addresses[i], 16) >= 0x80000000 else '80'+addresses[i])
        f.seek(0)
        f.write('\n'.join(data))
