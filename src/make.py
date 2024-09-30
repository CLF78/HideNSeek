import os
from shutil import rmtree
from subprocess import call
from elftools.elf.elffile import ELFFile as elf

# Locate various things
gcc = os.path.join("..", "devkitPPC", "bin", "powerpc-eabi-gcc")
objcopy = os.path.join("..", "devkitPPC", "bin", "powerpc-eabi-objcopy")
destdir = 'bin'

# Initialize variables
startHook = 0x8000629C
startFuncName = 'start'
excludefile = 'excludes.txt'
extensions = ['.s', '.S', '.c']

def build(isBootStrap: bool):

    # Initialize vars
    if isBootStrap:
        mainpath = 'bootstrap'
        outname = ''
        regionlist = ['Loader']
    else:
        mainpath = 'payload'
        outname = 'HideNSeek'
        regionlist = ['P', 'E', 'J', 'K']

    # Pretty print
    print('Building', mainpath + '...')

    # Get excluded files
    if os.path.isfile(excludefile):
        with open(excludefile) as f:
            excludes = [line.rstrip() for line in f.readlines()]
    else:
        excludes = []

    # Get all files in the source folder
    filelist = [os.path.join(root, item) for root, s, files in os.walk(mainpath) for item in files if item not in excludes and os.path.splitext(item)[1] in extensions]

    for region in regionlist:
        # Assemble destination file
        outputfile = f'{destdir}/{outname}{region}.'

        # Initialize GCC command
        cc_command = [gcc, '-Iinclude', '-pipe', '-nostartfiles', '-nostdinc', f'-Wl,-T,{mainpath}/mem.ld,-T,rmc.ld']

        # Add other build-specific stuff
        if not isBootStrap:
            cc_command += ['-D', f'REGION_{region}', '-Os', f'-Wl,-T,rmc{region.lower()}.ld']
        else:
            cc_command.append('-O2')

        # Add all cpp files and the destination
        cc_command += filelist
        cc_command += ['-o', outputfile + 'o']

        # Debug output for testing
        # print(*cc_command)

        # Call GCC to compile everything
        c = call(cc_command)
        if c != 0:
            print('Build failed!')
            continue

        # Get offset to start function
        if isBootStrap:
            with open(outputfile + 'o', 'rb') as f:
                startFunc = elf(f).get_section_by_name('.symtab').get_symbol_by_name(startFuncName)[0]['st_value']
            instruction = (((startFunc-startHook) & 0x3FFFFFC) | 0x48000000)
            print('Insert', hex(instruction), 'at', hex(startHook))

        # Convert to binary
        print(f'Converting {region} to binary...')
        c = call([objcopy, '-O', 'binary', '-R', '.eh_frame', '-R', '.eh_frame_hdr', outputfile + 'o', outputfile + 'bin'])
        if c != 0:
            print('Build failed!')
        else:
            print(f'Built {region}!')

def main():
    # Make a clean build folder
    if os.path.isdir(destdir):
        rmtree(destdir)
    os.mkdir(destdir)

    # Build it!
    build(False)
    build(True)

    # We're done!
    print('Built all!')

if __name__ == '__main__':
	main()
