.include "asm_setup.S"

.extern MainMenuButtonSetup, ResetText
.global MainMenuButtonSetup1, MainMenuButtonSetup2, MainMenuCrashFix

# Only keep buttons 2 and 3
MainMenuButtonSetup1:
cmpwi r27, 0x2
bge keepButton

# Hide the others
li r3, 1
stb r3, 0x80(r29)

# Set all buttons to Y coordinate 0
keepButton:
li r3, 0
stw r3, 0x20(r29)

# Original instruction
cmpwi r27, 0
blr

# Original instruction
MainMenuButtonSetup2:
addi r27, r27, 0x18

# Reset text
mr r3, r27
bl ResetText

# Skipped instruction
stw r27, 0xCA4(r28)
b MainMenuButtonSetup+0x70C

# Check if button exists
MainMenuCrashFix:
cmpwi r0, 4
bgt buttonExists

# Set button to 1P Wifi
li r0, 4

# Original instruction
buttonExists:
rlwinm r0,r0,2,0,29
blr   
