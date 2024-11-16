.include "asm_setup.S"

.extern DoInsertTrackIdent, clearSendRH2
.global InsertTrackIdent

InsertTrackIdent:
mflr r9
stw r0, 0x110(r3) # Original instruction
b DoInsertTrackIdent
mtlr r9
b clearSendRH2

