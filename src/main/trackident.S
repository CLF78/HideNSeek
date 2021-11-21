.include "asm_setup.S"

.extern TrackIdentifierHook, TrackIdentifierHook2, CalcCRC32, ENPTCRC
.global TrackIdentifier, TrackIdentifier2, TrackIdentifier3

# Original instruction
TrackIdentifier:
stw r3, 0(r25)

# Calculate CRC
mr r3, r26
mulli r4, r27, 0x14
bl CalcCRC32

# Store result
lis r4, ENPTCRC@ha
stw r3, ENPTCRC@l(r4)
b TrackIdentifierHook+4

# Skipped instructions
TrackIdentifier2:
stw r3, 0x10(r29)
lis r4, 0x4B54
mr r3, r29
b TrackIdentifierHook2+4

# Skipped instruction
TrackIdentifier3:
stw r3, 0x8(r29)
b TrackIdentifierHook2+0x34
