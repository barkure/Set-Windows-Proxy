@echo off
chcp 65001
setlocal

:menu
cls
echo plesae select an option:
echo 1. set system proxy to 192.168.31.46:7890
echo 2. disable Windows Proxy
echo 3. set git proxy to 127.0.0.1:7890
echo 4. remove_git_proxy
echo 5. show current git proxy settings
echo 0. exit

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    python proxy.py enable_system_proxy
    pause
    goto menu
)

if "%choice%"=="2" (
    python proxy.py disable_system_proxy
    pause
    goto menu
)

if "%choice%"=="3" (
    python proxy.py set_git_proxy
    pause
    goto menu
)

if "%choice%"=="4" (
    python proxy.py remove_git_proxy
    pause
    goto menu
)

if "%choice%"=="5" (
    echo current HTTP proxy settings:
    git config --global http.proxy
    echo current HTTPS proxy settings:
    git config --global https.proxy
    pause
    goto menu
)

if "%choice%"=="0" (
    exit
)

echo invalid choice, please try again
pause
goto menu