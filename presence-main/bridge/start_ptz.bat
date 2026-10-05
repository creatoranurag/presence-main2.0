@echo off
cd /d "%~dp0"
if not exist .venv ( python -m venv .venv && call .venv\Scripts\activate && pip install pyautogui ) else ( call .venv\Scripts\activate )
echo.
echo  1 = first time: calibrate V380 joystick arrows
echo  2 = run helper (V380 joystick mode)
echo  3 = run helper (ONVIF camera)
echo  4 = run helper (test mode, no camera)
set /p CH=Choose 1-4: 
if "%CH%"=="1" python ptz_helper.py --calibrate
if "%CH%"=="2" python ptz_helper.py --backend ui
if "%CH%"=="3" ( set /p IP=Camera IP: & set /p PW=Camera password: & python ptz_helper.py --backend onvif --host %IP% --password %PW% )
if "%CH%"=="4" python ptz_helper.py --backend mock
pause
