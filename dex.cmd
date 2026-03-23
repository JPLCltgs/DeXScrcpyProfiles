@echo off
setlocal enabledelayedexpansion

echo ============================================
echo        ANDROID DESKTOP - SCRCPY PROFILES
echo ============================================

REM --- Load last used IP ---
if exist last_ip.txt (
    set /p LASTIP=<last_ip.txt
    echo Last detected IP: !LASTIP!
) else (
    set LASTIP=
)

set /p IP=Enter your phone IP (Wireless) or ADB Device ID (press ENTER to use !LASTIP!):

if "%IP%"=="" (
    set IP=!LASTIP!
)

echo Using IP: !IP!

<nul set /p ="%IP%" > last_ip.txt

echo.
REM --- Load last used resolution ---
if exist last_res.txt (
    set /p LASTRES=<last_res.txt
    echo Last detected resolution: !LASTRES!
) else (
    set LASTRES=1920x1200
)

set /p RES=Enter display resolution (press ENTER to use !LASTRES!):

if "%RES%"=="" (
    set RES=!LASTRES!
)

echo Using resolution: !RES!
echo.
<nul set /p ="%RES%" > last_res.txt



echo.
echo Restarting ADB in TCP/IP mode...
.\adb tcpip 5555 >nul

echo Connecting to %IP%:5555 ...
.\adb connect %IP%:5555

:menu
cls
echo ============================================
echo              SELECT A PROFILE
echo ============================================
echo 1 - Productivity (Windowed Desktop Mode)
echo 2 - Clone Phone Screen (Low Latency)
echo 3 - Advanced Mode
echo 4 - Exit
echo ============================================
set /p option=Choose an option:

if "%option%"=="1" goto productivity
if "%option%"=="2" goto clone
if "%option%"=="3" goto advanced
if "%option%"=="4" exit
goto menu

:apply_productivity_settings
echo Enabling desktop/freeform/landscape behavior...
adb shell settings put global enable_freeform_support 1
adb shell settings put global force_resizable_activities 1
adb shell settings put global force_desktop_mode_on_external_displays 1
adb shell settings put system user_rotation 1
adb shell settings put system accelerometer_rotation 0
goto :eof

:restore_settings
echo Restoring phone settings to normal...
adb shell settings put global enable_freeform_support 0
adb shell settings put global force_resizable_activities 0
adb shell settings put global force_desktop_mode_on_external_displays 0
adb shell settings put system accelerometer_rotation 1
adb shell settings put system user_rotation 0
goto :eof

:productivity
echo.
echo Launching scrcpy - PRODUCTIVITY MODE
call :apply_productivity_settings
scrcpy --new-display=%RES%/240 --max-fps=60 --video-codec=h264 --video-bit-rate=3M
call :restore_settings
exit

:clone
echo.
echo Launching scrcpy - CLONE PHONE SCREEN (Low Latency)
scrcpy --max-fps=60 --video-codec=h264 --turn-screen-off
exit

:advanced
cls
echo ============================================
echo              ADVANCED MODE
echo ============================================
echo 1 - Fast Mode  (Productivity - Speed)
echo     Params: %RES%/260, 8 Mbps, H.264, no audio
echo.
echo 2 - High Quality
echo     Params: %RES%/300, 16 Mbps, H.264
echo.
echo 3 - Ultra Quality
echo     Params: %RES%/320, 32 Mbps, H.265
echo.
echo 4 - Maximum Quality
echo     Params: %RES%/340, 50 Mbps, H.265
echo.
echo 5 - Back
echo ============================================
set /p adv=Choose an option:

if "%adv%"=="1" goto fast
if "%adv%"=="2" goto high
if "%adv%"=="3" goto ultra
if "%adv%"=="4" goto maximum
if "%adv%"=="5" goto menu
goto advanced

:fast
echo.
echo Launching scrcpy - FAST MODE (Productivity - Speed)
call :apply_productivity_settings
scrcpy --new-display=%RES%/260 --max-fps=60 --video-codec=h264 --video-bit-rate=8M --no-audio
call :restore_settings
exit

:high
echo.
echo Launching scrcpy - HIGH QUALITY (Productivity)
call :apply_productivity_settings
scrcpy --new-display=%RES%/300 --max-fps=60 --video-codec=h264 --video-bit-rate=16M
call :restore_settings
exit

:ultra
echo.
echo Launching scrcpy - ULTRA QUALITY (Productivity)
call :apply_productivity_settings
scrcpy --new-display=%RES%/320 --max-fps=60 --video-codec=h265 --video-bit-rate=32M
call :restore_settings
exit

:maximum
echo.
echo Launching scrcpy - MAXIMUM QUALITY (Productivity)
call :apply_productivity_settings
scrcpy --new-display=%RES%/340 --max-fps=60 --video-codec=h265 --video-bit-rate=50M
call :restore_settings
exit