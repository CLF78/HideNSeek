.include "asm_setup.S"

.extern NoClip
.global NoClipHelper

NoClipHelper:
mr r4, r31
b NoClip
