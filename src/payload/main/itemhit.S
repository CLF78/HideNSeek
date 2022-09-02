.include "asm_setup.S"

.extern ItemHitLocal, ItemHitRemote, ItemHitRemoteHook
.global ItemHitLocalHelper, HitboxPatch1, HitboxPatch2, ItemHitRemoteASM

#####################
# Item Hit Helper 1 #
#####################

# Move player to r4
ItemHitLocalHelper:
mr r4, r31
mr r5, r30
b ItemHitLocal

##################
# Hitbox Patch 1 #
##################

# Save LR
HitboxPatch1:
mflr r3

# Original instruction
lfs f28, 0x4(r29)

# Do bl trick
bl trick
.float 1.25

# Load multiplier in f2
trick:
mflr r5
lfs f2, 0(r5)

# Multiply
fmuls f28, f28, f2

# Restore LR and return
mtlr r3
blr

##################
# Hitbox Patch 2 #
##################

# Original instruction
HitboxPatch2:
lfs f29, 0x4(r4)

# Multiply and return
fmuls f29, f29, f2
blr

######################################################
# Trampoline for ItemHitRemote because Wiimmfi sucks #
######################################################

# Original instruction
ItemHitRemoteASM:
add r4, r0, r23

# Call our function and skip Wiimmfi hook
bl ItemHitRemote
b ItemHitRemoteHook+8
