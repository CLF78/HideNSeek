.include "asm_setup.S"

.extern TimerChecks, No5LimitHook, Raceinfo
.global StartingTime, StartingTime2, TimerEnd, TimerEndManager, TimerVals

##########################
# Starting Time Modifier #
##########################

# Assume regular start timer
StartingTime:
li r31, 1800

# Check if HalfTimer is 2
cmpwi r11, 2
bne+ end2

# Set it to 3600 if so
slwi r31, r31, 1

# Original instruction
end2:
stw r31, 0x48(r29)
blr

############################
# Starting Time Modifier 2 #
############################

# Assume regular timer
StartingTime2:
li r12, 30

# Check if HalfTimer is 2
lis r11, HalfTimer@ha
lbz r11, HalfTimer@l(r11)
cmpwi r11, 2
bne+ end

# Set seconds to 0 and minutes to 1
mr r12, r31
sth r30, 0x14(r3)

# Modified original instruction
end:
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

# Check if EndReason is not 0
cmpwi r3, 0
bne endRace

# Do not end the race yet
noEndRace:
b No5LimitHook+0x98

# End the race
endRace:
b No5LimitHook+0x50

#####################
# Timer End Manager #
#####################

# Get endReason
TimerEndManager:
lbz r4, 0xB84(r3)
slwi r4, r4, 2
lis r3, Raceinfo@ha
lwz r3, Raceinfo@l(r3)
lwz r3, 0xC(r3)
lwzx r3, r3, r4
lwz r3, 0x44(r3)

# Return (endReason == 2)
xori r3, r3, 2
cntlzw r3, r3
srwi r3, r3, 5
blr

################
# Timer Values #
################

TimerVals:
.long 0x8CA0, 0x4650, 0x34BC0
