from subprocess import run

regionlist = ['E', 'F', 'G', 'I', 'J', 'K', 'M', 'Q', 'S', 'U']

def main():
	print('Building UI assets...')
	run(['wszst', 'create', '--szs', 'Global', '--dest', 'Patch.szs', '-o'])
	for region in regionlist:
		run(['wszst', 'create', '--szs', region, '--dest', f'Patch_{region}.szs', '-o'])

if __name__ == '__main__':
	main()
