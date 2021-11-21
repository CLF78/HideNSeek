.include "asm_setup.S"

.extern TrackIdentifierHook, CalcCRC32, ENPTCRC
.global TrackIdentifier

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
