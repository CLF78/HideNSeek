# Global imports
import os
import shutil
from subprocess import run

# Local imports
from files.UIPatches.buildui import main as buildui
from src.make import main as buildsrc

"""
HOW TO USE
- Make sure wszst and 7z are installed
- Read the notes for every other script (if present)
- Run this script
"""

root = os.path.join('..', '..')
riivoroot = os.path.join('build', 'Riivo', 'hns')
isoroot = os.path.join('build', 'ISO', 'hns')

# Ignore any file except those with the given extension
def fileFilter(d, ext):
	return [os.path.join(d, entry.name) for entry in os.scandir(d) if entry.is_file() and entry.name.endswith('.' + ext)]

# Build caller
def callBuildScript(fileSrc, destRiivo, destIso, buildFunc, fileExt, isSrc=False):

	# Cwd to the script's folder and call function
	os.chdir(fileSrc)

	if buildFunc:
		buildFunc()

	# A bunch of hardcodes
	if isSrc:
		os.chdir('..')
		filelist = fileFilter(os.path.join(fileSrc, 'bin'), fileExt)
	else:
		os.chdir(root)
		filelist = fileFilter(fileSrc, fileExt)

	# Make destination folders if necessary
	os.makedirs(destRiivo, exist_ok=True)
	os.makedirs(destIso, exist_ok=True)

	# Copy files to Riivo folder and move them to ISO folder
	for file in filelist:
		shutil.copy(file, destRiivo)
		shutil.move(file, destIso)

def main():
	# Clean build folders
	if os.path.isdir(isoroot):
		shutil.rmtree(isoroot)
	if os.path.isdir(riivoroot):
		shutil.rmtree(riivoroot)

	# Build ui patches
	callBuildScript(os.path.join('files', 'UIPatches'),
		os.path.join(riivoroot, 'UI'),
		isoroot,
		buildui,
		'szs')

	# Build code
	callBuildScript('src',
		os.path.join(riivoroot, 'hns'),
		os.path.join(isoroot, 'code'),
		buildsrc,
		'bin',
		True)

	# Move the loader back
	shutil.move(os.path.join(riivoroot, 'hns', 'Loader.bin'), riivoroot)
	shutil.move(os.path.join(isoroot, 'code', 'Loader.bin'), isoroot)

	# Add My Stuff folder to Riivo
	os.mkdir(os.path.join(riivoroot, 'My Stuff'))

	# Create zips
	arcname = 'HNS'
	isoname = f'{arcname} ISO Patcher.zip'
	isoname2 = isoname.replace(' ', '_')
	run(['7z', 'a', '-mx=9', f'{arcname}.zip', './build/Riivo/*'])
	run(['7z', 'a', '-mx=9', isoname2, './build/ISO/*'])
	os.rename(isoname2, isoname)

	# All done!
	print('Built all!')

if __name__ == '__main__':
	main()
