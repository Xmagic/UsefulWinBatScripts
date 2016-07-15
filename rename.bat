@echo off
::This script is used for renaming files (Remove certain chars) from the target folder and its sub-folders
:MAIN

::Warning: If the charToRemove contains chinese charactors, this file must be encoded as ANSI
set charToRemove=[µÁ”∞ÃÏÃ√www.dygod.cn]
set targetDir=F:\Movie\

::dir /A:-D /S /B is used to list all non-directory files
::~n is used for get the file name not the full path
::~x is used to get the file extention
::%%~xni is used to get the file and its extention

::~d is to get the disk name (F:)
::~p is to get the parent path(\Move\test)
::~dpi is to get the full parent path (F:\Movie\test and F:\Movie\test\sub)
for /F "tokens=*" %%i in ('dir /A:-D /S /B %targetDir%') do call :DO_RENAME %%~nxi %%~dpi

goto EOF


:DO_RENAME
set tmpParentPath=%2
set tmpDir=%1
CALL set tmpResultDir=%%tmpDir:%charToRemove%=%%

::echo %charToRemove%
::echo %tmpDir%
::echo %tmpResultDir%

if %tmpDir% == %tmpResultDir% echo Skipping file %tmpParentPath%%tmpDir% & goto END_DO_RENAME

echo Renaming file from "%tmpParentPath%%tmpDir%" to "%tmpParentPath%%tmpResultDir%" 

::Enter into the target Dir and prepare for executing renaming
cd /d %tmpParentPath%
ren "%tmpDir%" "%tmpResultDir%"

:END_DO_RENAME

:EOF

:ERROR

::Go back to where we place this script
cd /d %~dp0%
