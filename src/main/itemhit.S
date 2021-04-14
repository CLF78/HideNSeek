.include "asm_setup.S"

.extern ItemHitLocal
.global ItemHitLocalHelper

#####################
# Item Hit Helper 1 #
#####################

# Move other player to r4
ItemHitLocalHelper:
mr r4, r31
b ItemHitLocal
