.include "asm_setup.S"

.extern InterpolationHook, InterpolationHook2
.global InterpFunc, InterpFunc2

##########
# Hook 1 #
##########

# Get player speed
InterpFunc:
lwz r12, 0(r30)
lwz r12, 0x28(r12)
lfs f3, 0x20(r12)
fabs f3, f3

# Load some floats
bl trick

.float 0.9
.float 150.0

trick:
mflr r12
lfs f1, 0(r12)
lfs f2, 0x4(r12)

# Interpolation = 0.9 - (speed / 150)
fdivs f2, f3, f2
fsubs f4, f1, f2
b InterpolationHook+4

##########
# Hook 2 #
##########

# Get player speed
InterpFunc2:
lwz r12, 0(r30)
lwz r12, 0x28(r12)
lfs f30, 0x20(r12)
fabs f30, f30

# Load some floats
bl trick2

.float 0.9
.float 150.0

trick2:
mflr r12
lfs f0, 0(r12)
lfs f2, 0x4(r12)

# Interpolation = 0.9 - (speed / 150)
fdivs f2, f30, f2
fsubs f1, f0, f2
b InterpolationHook2+4
