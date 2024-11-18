@echo off
Setlocal EnableDelayedExpansion

cls
echo Hide and Seek ISO Builder
echo by damysteryman, edited by CLF78
echo Powered by WIT by Wiimm
pause

echo.
echo Checking resources...

IF NOT EXIST "hns" (
	echo.
	echo Cannot find the hns folder.
	echo.
	echo Please make sure you have it in the same directory
	echo as this script. Exiting...
	echo.
	pause
	exit
	)

IF EXIST mkw.d (
	GOTO CHECK
	)

echo.
echo Unpacking the original game...
wit\wit.exe extract -s ../ -1 -n RMC.01 . mkw.d --psel=DATA -ovv

:CHECK
echo.
IF EXIST mkw.d\files\Scene\UI\Race_E.szs (
	SET GAMEID=RMCP01
	SET LETTER=P
	echo Detected version: PAL
	GOTO COPY
	)
IF EXIST mkw.d\files\Scene\UI\Race_U.szs (
	SET GAMEID=RMCE01
	SET LETTER=E
	echo Detected version: NTSC-U
	GOTO COPY
	)
IF EXIST mkw.d\files\Scene\UI\Race_J.szs (
	SET GAMEID=RMCJ01
	SET LETTER=J
	echo Detected version: NTSC-J
	GOTO COPY
	)
IF EXIST mkw.d\files\Scene\UI\Race_K.szs (
	SET GAMEID=RMCK01
	SET LETTER=K
	echo Detected version: NTSC-K
	GOTO COPY
	)

echo Cannot find a valid Mario Kart Wii ISO/WBFS file.
echo.
echo Please make sure you have one in the same directory
echo as this script. Exiting...
pause
exit

:COPY
echo.
echo The script will now pause to let you replace any file on the disc.
echo DO NOT patch this game with the Wiimmfi patcher, or it'll break the game.
echo Press any button to resume the procedure.
pause

echo.
echo Copying mod files...

mkdir mkw.d\files\hns
copy /y hns\code\HideNSeek%LETTER%.bin mkw.d\files\hns >nul
copy /y hns\Patch.szs mkw.d\files\Scene\UI >nul

IF %LETTER%==P (
	copy /y hns\Patch_E.szs mkw.d\files\Scene\UI >nul
	copy /y hns\Patch_F.szs mkw.d\files\Scene\UI >nul
	copy /y hns\Patch_G.szs mkw.d\files\Scene\UI >nul
	copy /y hns\Patch_I.szs mkw.d\files\Scene\UI >nul
	copy /y hns\Patch_S.szs mkw.d\files\Scene\UI >nul
)

IF %LETTER%==E (
	copy /y hns\Patch_M.szs mkw.d\files\Scene\UI >nul
	copy /y hns\Patch_Q.szs mkw.d\files\Scene\UI >nul
	copy /y hns\Patch_U.szs mkw.d\files\Scene\UI >nul
)

IF %LETTER%==J (
	copy /y hns\Patch_J.szs mkw.d\files\Scene\UI >nul
)

IF %LETTER%==K (
	copy /y hns\Patch_K.szs mkw.d\files\Scene\UI >nul
)

echo.
SET /P NOMUS=Disable Music? (Y/N):
IF /i %NOMUS%==Y (wit\wit.exe dolpatch mkw.d/sys/main.dol 80004000=01 -q) ELSE (wit\wit.exe dolpatch mkw.d/sys/main.dol 80004000=00 -q)

echo.
SET /P FRAMERATE=Force 30 FPS? (Y/N):
IF /i %FRAMERATE%==Y (wit\wit.exe dolpatch mkw.d/sys/main.dol 8000400F=01 -q) ELSE (wit\wit.exe dolpatch mkw.d/sys/main.dol 8000400F=00 -q)

wit\wit.exe dolpatch mkw.d/sys/main.dol 8000629C=4BFFDF58 load=80004010,hns/Loader.bin -q

echo.
echo Format Selection:
echo 1. WBFS
echo 2. ISO
echo 3. Extracted Filesystem (ADVANCED USERS ONLY)
SET /P EXTINPUT=Enter the number corresponding to the format you want:

IF %EXTINPUT%==1 (
	SET FILEEXT=wbfs
	GOTO BUILD
	)
IF %EXTINPUT%==2 (
	SET FILEEXT=iso
	GOTO BUILD
	)
IF %EXTINPUT%==3 (
	GOTO END
	)

echo.
echo Invalid option selected.
GOTO FORMSEL

:BUILD
SET DESTPATH=Hide and Seek [%GAMEID%].%FILEEXT%
echo.
echo Rebuilding game...
wit\wit.exe copy mkw.d "%DESTPATH%" -ovv --id=....01 --name="Hide and Seek"

echo.
echo File saved as %DESTPATH%
echo Cleaning up...
rmdir mkw.d /s /q
GOTO END

:END
echo.
echo All done"^!"
pause
