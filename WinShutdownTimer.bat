@echo off
:start
SET /p hourSinceNow=��ϣ����Сʱ��ػ�? (����0ȡ��֮ǰ�ػ��ƻ�) & echo.
if "%hourSinceNow%"=="0" goto cancelShutDown

echo.
SET /p choice=ȷ�� '%hourSinceNow%' Сʱ֮��ػ�?(y=ȷ��, n=�˳�)
if "%choice%"=="y" goto doShutDown
if "%choice%"=="n" echo �Ѻ��� & goto start

:doShutDown
set /a sec=%hourSinceNow% * 3600
shutdown -s -t %sec%
goto End


:cancelShutDown
shutdown -a

:End
echo ��������˳� & pause
exit 