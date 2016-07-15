@echo off
:start
SET /p hourSinceNow=你希望几小时后关机? (输入0取消之前关机计划) & echo.
if "%hourSinceNow%"=="0" goto cancelShutDown

echo.
SET /p choice=确认 '%hourSinceNow%' 小时之后关机?(y=确认, n=退出)
if "%choice%"=="y" goto doShutDown
if "%choice%"=="n" echo 已忽略 & goto start

:doShutDown
set /a sec=%hourSinceNow% * 3600
shutdown -s -t %sec%
goto End


:cancelShutDown
shutdown -a

:End
echo 按任意键退出 & pause
exit 