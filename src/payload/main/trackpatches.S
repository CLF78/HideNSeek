.include "asm_setup.S"

.global MapleTreewayArea, ToadFactoryAreas

##############################
# KMP AREAs - Toad's Factory #
##############################

ToadFactoryAreas:
.byte 0, 0xA, 0xFF, 0
.float -42600.0, 3000.0, -1750.0
.float 0.0, 0.0, 0.0
.float 2.0, 2.0, 2.0
.long 0, 0x00FF0000

.byte 0, 0xA, 0xFF, 0
.float -12600.0, 3000.0, -1750.0
.float 0.0, 0.0, 0.0
.float 2.0, 2.0, 2.0
.long 0, 0x00FF0000

.byte 0, 0xA, 0xFF, 0
.float 17500.0, 900.0, -36000.0
.float 0.0, 0.0, 0.0
.float 1.0, 0.1, 1.0
.long 0, 0x00FF0000

#############################
# KMP AREAs - Maple Treeway #
#############################

MapleTreewayArea:
.byte 0, 0xA, 0xFF, 0
.float 10560.0, 12900.0, 17377.0
.float 0.0, 0.0, 0.0
.float 1.5, 0.1, 1.5
.long 0, 0x00FF0000
