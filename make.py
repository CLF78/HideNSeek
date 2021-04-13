import os
from shutil import rmtree
from subprocess import call
from elftools.elf.elffile import ELFFile as elf

# Locate various things
asm = 'powerpc-eabi-as'
gcc = 'powerpc-eabi-gcc'
objcopy = 'powerpc-eabi-objcopy'

# Initialize variables
startHook = 0x8000629C
debug = False
regionlist = ['P', 'E', 'J', 'K']

def build(isBootStrap):
    # Initialize lists
    asmlist = []
    cpplist = []

    if isBootStrap:
        mainpath = 'bootstrap'
        outname = 'Loader'
        print('Building bootstrap...')
    else:
        mainpath = 'src'
        outname = 'HideNSeek'
        print('Building payload...')

    # Get all files in the source folder
    for root, subfolder, files in os.walk(mainpath):
        for item in files:
            if item.lower().endswith('.s'):
                filename = os.path.join(root, item)
                asmlist.append(filename)
            elif item.lower().endswith('.c'):
                filename = os.path.join(root, item)
                
                # A hack because i'm lazy
                if item == 'main.c':
                    cpplist.insert(0, filename)
                else:
                    cpplist.append(filename)

    for region in regionlist:
        # Make a clean build folder
        if os.path.isdir('build'):
            rmtree('build')
        os.mkdir('build')

        # FUCK DEVKIT
        with open('asm_setup.S', 'r+') as f:
            f.seek(0, 2)
            f.seek(f.tell()-4, 0)
            f.write(region)

        # Compile the asm
        for file in asmlist:
            c = call([asm, '-mregnames', '-m750cl', file, '-o', os.path.join('build', os.path.basename(file)[:-2] + '.o')])
            if c != 0:
                print('Build failed!')
                return

            file = file.replace('.S', '.o')

        # Initialize GCC command
        cc_command = [gcc, '-Iinclude', '-nostartfiles', '-nostdinc', '-D', 'REGION_{}'.format(region), '-Os', '-Wl,-T,{}/mem.ld,-T,rmc.ld,-T,rmc{}.ld'.format(mainpath, region.lower()), '-ffunction-sections', '-fdata-sections', '-mcpu=750', '-meabi', '-mhard-float']

        # Add debug macro if debug is on
        if debug:
            cc_command += ['-D', 'DEBUG']

        # Add all cpp files and the destination
        cc_command += cpplist
        cc_command += asmlist
        cc_command += ['-o', 'build/{}{}.o'.format(outname, region)]

        # Call GCC and Objcopy
        c = call(cc_command)
        if c != 0:
            print('Build failed!')
            return

        # Get offset to start function
        if isBootStrap:
            with open('build/{}{}.o'.format(outname,region), 'rb') as f:
                elfData = elf(f)
                symtab = elfData.get_section_by_name('.symtab')
                startFunc = symtab.get_symbol_by_name('start')[0].entry['st_value']
                instruction = (((startFunc-startHook) & 0x3FFFFFF ) | 0x48000000)
                print('New instruction is', hex(instruction))

        c = call([objcopy, '-O', 'binary', '-R', '.eh_frame', '-R', '.eh_frame_hdr', 'build/{}{}.o'.format(outname, region), 'bin/{}{}.bin'.format(outname, region)])
        if c != 0:
            print('Build failed!')
            return
        else:
            print('Built', region + '!')

    # We're done!
    rmtree('build')
    print('All built!')

def main():
    # Debug prompt
    debug = input('Enable debug mode? (Y/N): ').lower() == 'y'

    # Make a clean bin folder
    if os.path.isdir('bin'):
        rmtree('bin')
    os.mkdir('bin')

    # Build it!
    build(False)
    build(True)

main()
