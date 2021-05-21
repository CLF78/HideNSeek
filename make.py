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
                cpplist.append(filename)

    for region in regionlist:
        # Make a clean build folder
        if os.path.isdir('build'):
            rmtree('build')
        os.mkdir('build')

        # Initialize GCC command
        cc_command = [gcc, '-Iinclude', '-nostartfiles', '-nostdinc', '-D', 'REGION_{}'.format(region), '-D', 'REGION=\'{}\''.format(region), '-Os', '-Wl,-T,{}/mem.ld,-T,rmc.ld,-T,rmc{}.ld'.format(mainpath, region.lower()), '-ffunction-sections', '-fdata-sections', '-fcommon', '-mcpu=750', '-meabi', '-mhard-float']

        # Add debug macro if debug is on
        if debug:
            cc_command += ['-D', 'DEBUG']

        # Add all cpp files and the destination
        cc_command += cpplist
        cc_command += asmlist
        cc_command += ['-o', 'build/{}{}.o'.format(outname, region)]

        # Debug output for testing:
        # print(*cc_command)

        # Call GCC to compile everything
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
    global debug
    debug = input('Enable debug mode? (Y/N): ').lower() == 'y'

    # Make a clean bin folder
    if os.path.isdir('bin'):
        rmtree('bin')
    os.mkdir('bin')

    # Build it!
    build(False)
    build(True)

main()
