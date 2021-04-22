.include "asm_setup.S"

.extern TimerChecks, No5LimitHook2, No5LimitHook3, EndReason
.global StartingTime, StartingTime2, TimerEnd

##########################
# Starting Time Modifier #
##########################

# Set timer
StartingTime:
li r31, 1800

# Original instruction
stw r31, 0x48(r29)
blr

############################
# Starting Time Modifier 2 #
############################

# Load 30 in r12
StartingTime2:
li r12, 30

# Modified original instruction
stb r12, 0x16(r3)
blr

##########################
# Disable 5 Minute Limit #
##########################

# This is an ASM helper for the main function in C

# Load Raceinfo
TimerEnd:
lwz r3, 0x4(r31)

# Check if countdown has ended
lwz r4, 0x28(r3)
cmpwi r4, 2
blt noEndRace

# Call function
bl TimerChecks

# Store r3 to EndReason
lis r4, EndReason@ha
stb r3, EndReason@l(r4)

# Check if EndReason is not 0
cmpwi r3, 0
bne endRace

# Do not end the race yet
noEndRace:
b No5LimitHook3

# End the race
endRace:
b No5LimitHook2
