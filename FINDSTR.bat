@ECHO OFF

CLS
MODE CON: COLS=75 LINES=30
ECHO ========================================================================
ECHO " ________ ___  ________   ________  ________  _________  ________     "   
ECHO "|\  _____\\  \|\   ___  \|\   ___ \|\   ____\|\___   ___\\   __  \    "   
ECHO "\ \  \__/\ \  \ \  \\ \  \ \  \_|\ \ \  \___|\|___ \  \_\ \  \|\  \   "  
ECHO " \ \   __\\ \  \ \  \\ \  \ \  \ \\ \ \_____  \   \ \  \ \ \   _  _\  "  
ECHO "  \ \  \_| \ \  \ \  \\ \  \ \  \_\\ \|____|\  \   \ \  \ \ \  \\  \| " 
ECHO "   \ \__\   \ \__\ \__\\ \__\ \_______\____\_\  \   \ \__\ \ \__\\ _\ "
ECHO "    \|__|    \|__|\|__| \|__|\|_______|\_________\   \|__|  \|__|\|__|"
ECHO "                                       \|_________|                   " 
ECHO ======================== ENTER DIRECTORY PATH ==========================
ECHO ------------------------------------------------------------------------
ECHO                   Example: C:\Users\username\Desktop
ECHO ------------------------------------------------------------------------
ECHO                      Enter NET for network path 
ECHO ========================================================================
ECHO ========================= PRESS 'Q' TO QUIT ============================
ECHO.

SET INPUT=
SET /P INPUT=Enter path of search folder here: 

IF /I '%INPUT%'=='Q' GOTO Quit
IF /I '%INPUT%'=='NET' GOTO Selection2

CD %INPUT%

GOTO Selection1


:Selection1
ECHO ========================================================================
SET SERIAL=
SET /P SERIAL=Please enter product serial number:
ECHO ========================================================================
ECHO Your logs will appear below, please be patient....
ECHO ========================================================================
FINDSTR /s /m %SERIAL% *.*
ECHO ========================================================================
ECHO DONE!
PAUSE>NUL
GOTO Quit

:Selection2

ECHO ========================================================================
ECHO      Example: \\FTP\Folder1
ECHO ========================================================================
SET NETPATH=
SET /P NETPATH=Enter path of search folder here:
ECHO ========================================================================
PUSHD %NETPATH%
SET SERIAL=
SET /P SERIAL=Please enter product serial number:
ECHO ========================================================================
ECHO Your logs will appear below, please be patient....
ECHO ========================================================================
FINDSTR /s /m %SERIAL% *.*
ECHO ========================================================================
ECHO DONE!
PAUSE>NUL
GOTO Quit

:Quit
CLS

ECHO ==============THANKYOU===============
ECHO -------------------------------------
ECHO ======PRESS ANY KEY TO CONTINUE======

PAUSE>NUL
EXIT

