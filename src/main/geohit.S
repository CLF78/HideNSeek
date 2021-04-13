.include "asm_setup.S"

.global GeoHitFix

# Original instruction
GeoHitFix:
stw r3, 0(r30)

# Load pointer to data (equivalent of offset 0x6 in the .bin file)
lwz r3, 0x24(r30)

# Load damage type 0x10
li r4, 0x10

# Store damage to CarA1, CarA2, CarA3, pakkun_f and cow
sth r4, 0x1CC(r3)
sth r4, 0x2DA(r3)
sth r4, 0x2E4(r3)
sth r4, 0x74E(r3)
sth r4, 0x758(r3)

# Return
blr
