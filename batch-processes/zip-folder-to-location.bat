:: Alex Lundin																
:: 05-25-2018	
:: Used to 
:: store backups of the Root folder for the user in case OneDrive fails
:: http://www.get-itsolutions.com/script-to-zip-file-using-cmd-batch-file/
:: Notes
:: This whole file is designed around parameters sent in from the calling function
:: This file also relies on the string-constants.bat inside the sub-process folder

:: parameters
:: $1 -- folderPathToZipUp
:: $2 -- locationToZipTo

:: save the parameters into the necessary variables
set "folderPathToZipUp=%~1"
set "locationToZipTo=%~2"

@echo off
REM echo Zipping folder %folderPathToZipUp% to this location:
REM echo %locationToZipTo%

call "%CD%\batch-processes\string-constants.bat"

set "folderThatCalled=%cd%"

cd %folderPathToZipUp%

:: save folder name from current directory
for %%a in (.) do set folderNameOnly=%%~na

:: create a custom string with date information to add to the zip file name
for /f "tokens=3,2,4 delims=/- " %%x in ("%time%") do set d=%%y%%x%%z

set data=%d%

set datetimef=%date:~-4%_%date:~3,3%_%date:~7,2%__%time:~0,2%_%time:~3,2%

set "zipFileName=%locationToZipTo%%folderNameOnly%_%datetimef%.zip"

:: use 7Zip to create the zip file
"%ProgramFilesInstallPath%\7-Zip\7z.exe" a -tzip "%zipFileName%" "%folderPathToZipUp%*" > NUL 2>&1
