#include <common.h>
#include <hidenseek.h>
#include <inputdata.h>
#include <menudata.h>
#include <raceinfo.h>

// Main func
int SpectatorModeMain(char ogpid) {

	// Check if Spectator Mode was enabled
	if (SpectatorMode) {

		// Get my controller, my inputs in this frame and the last frame
		int controller = MenuData->sub.holders[0].controllerInfo & 3;
		u16 input = MenuData->sub.holders[0].controllerHolder->inputStates[0].buttonRaw;
		u16 previnput = MenuData->sub.holders[0].controllerHolder->inputStates[1].buttonRaw;

		// Get the current spectated pid and my own pid
		s8 pid = CurrentSpectated;
		s8 increment = 0;

		// Check if the current spectated pid disappeared (if so, force switch pid)
		if (Raceinfo->players[pid]->stateFlags >> 4 & 1)
			increment = 1;

		// Check if the button presses are different from the previous frame to avoid spamming
		if (input != 0 && input != previnput) {
			
			switch(controller) {

				// GameCube (both Wavebird and normal)
				case 0:
					if (input >> 10 & 1 || (input-0x80) >> 10 & 1)		// 0x400 = X Button
						increment = 1;
					else if (input >> 11 & 1 || (input-0x80) >> 11 & 1)	// 0x800 = Y Button
						increment = -1;
					if (input >> 4 & 1 || (input-0x80) >> 4 & 1)		// 0x10 = Z Button
						UseReplayCams = !UseReplayCams;
					break;

				// Wii Wheel
				case 1:
					if (input >> 9 & 1)			// 0x200 = 2 Button
						increment = 1;
					else if (input >> 8 & 1)	// 0x100 = 1 Button
						increment = -1;
					if (input >> 12 & 1)		// 0x1000 = - Button
						UseReplayCams = !UseReplayCams;
					break;
				
				// Nunchuck
				case 2:
					if (input >> 11 & 1)		// 0x800 = A Button
						increment = 1;
					else if (input >> 10 & 1)	// 0x400 = B Button
						increment = -1;
					if (input >> 12 & 1)		// 0x1000 = - Button
						UseReplayCams = !UseReplayCams;
					break;

				// Classic Controller
				case 3:
					if (input >> 4 & 1)			// 0x10 = A Button
						increment = 1;
					else if (input >> 6 & 1)	// 0x40 = B Button
						increment = -1;
					if (input >> 3 & 1)			// 0x8 = X Button
						UseReplayCams = !UseReplayCams;
					break;

				// Should never happen but whatever
				default:
					break;
			}
		}

		// Get another pid if the increment is not 0
		if (increment != 0) {
			for (int i = 0; i < HideNSeekData.playerCount; i++) {

				// Increment by the chosen value
				pid += increment;

				// Failsafe to loop around
				if (pid >= HideNSeekData.playerCount)
					pid = 0;
				else if (pid < 0)
					pid = HideNSeekData.playerCount - 1;

				// Check that the pid did not disappear as well
				if (!(Raceinfo->players[pid]->stateFlags >> 4 & 1)) {
					CurrentSpectated = pid;
					break;
				}
			}
		}

		return pid;
	}

	return ogpid;
}
