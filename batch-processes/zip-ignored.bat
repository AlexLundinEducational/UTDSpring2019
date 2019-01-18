:: Alex Lundin																	
:: 01-18-2019
:: Used to
:: Create zip backups of untracked files in my git repo
:: Notes
:: This whole file is designed around a relative path, one level up from this folder

@echo off

:: common block between these batch processes to save folder information
set "folderThatCalled=%cd%"
cd ..\
set "sourceRepositoryRoot=%cd%"
:: save folder name from current directory
for %%a in (.) do set sourceFolderName=%%~na

set "CdriveSourceFolder=C:\%sourceFolderName%"
set "networkLab=%CdriveSourceFolder%\3.1-CS-4396.001"
set "networkSec=%CdriveSourceFolder%\2.2-CS-4393.001"
set "softwareProj=%CdriveSourceFolder%\3.2-SE-4485.001"

set "zipbackups=%CdriveSourceFolder%\zip-backups\"

CALL :ZIPCONTENTS %networkLab% %zipbackups%

REM execution always reaches here
REM this line exits the program with the EXIT /B
EXIT /B

:: parameters
:: $1 -- folderPathToZipUp
:: $2 -- locationToZipTo

:: Zip any file in the target folder on the C drive
:ZIPCONTENTS
:: save the parameters into the necessary variables
set "folderPathToZipUp=%~1"
set "locationToZipTo=%~2"
echo.
echo Zip started
echo ...
@echo off
set "folderPathToZipUp=%CdriveSourceFolder%"
cd "%folderThatCalled%"
call "%CD%\batch-processes-zip-folder-to-location.bat" "%folderPathToZipUp%" "%locationToZipTo%"
echo Zip complete
goto :EOF
