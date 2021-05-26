.include "asm_setup.S"

.extern InterpolationHook, InterpolationHook2
.global InterpFunc, InterpFunc2

##########
# Hook 1 #
##########

# Original instruction
InterpFunc:
lfs f4, 0x20(r31)

# Get player speed
lwz r12, 0(r30)
lwz r12, 0x28(r12)
lfs f3, 0x20(r12)

# Load some floats
bl trick

.float 1.0
.float 120.0

trick:
mflr r12
lfs f1, 0(r12)
lfs f2, 0x4(r12)

# Interpolation = 1.0 - (speed / 120)
fdivs f2, f3, f2
fsubs f2, f1, f2

# Check if result is less than the original value
fcmpo cr0, f2, f4
blt+ end

# If not, use the new value
fmr f4, f2

# Return
end:
b InterpolationHook+4

##########
# Hook 2 #
##########

# Original instruction
InterpFunc2:
lfs f1, 0x20(r31)

# Get player speed
lwz r12, 0(r30)
lwz r12, 0x28(r12)
lfs f30, 0x20(r12)

# Load some floats
bl trick2

.float 1.0
.float 120.0

trick2:
mflr r12
lfs f0, 0(r12)
lfs f2, 0x4(r12)

# Interpolation = 1.0 - (speed / 120)
fdivs f2, f30, f2
fsubs f2, f0, f2

# Check if result is less than the original value
fcmpo cr0, f2, f1
blt+ end2

# If not, use the new value
fmr f1, f2

# Return
end2:
b InterpolationHook2+4
