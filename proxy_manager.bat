@echo off
setlocal

:menu
cls
echo PROXY MANAGER
echo -----------------------------------------------------
echo plesae select an option:
echo -----------------------------------------------------
echo 1. set system proxy to opi (192.168.31.46:7890)
echo 2. set system proxy to clash verge (127.0.0.1:7890)
echo 3. disable system proxy
echo 4. set git proxy to clash verge (127.0.0.1:7890)
echo 5. remove git proxy
echo 6. show current git proxy settings
echo 0. exit
echo -----------------------------------------------------

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    python proxy.py enable_system_proxy_to_opi
    pause
    goto menu
)

if "%choice%"=="2" (
    python proxy.py enable_system_proxy_to_clash_verge
    pause
    goto menu
)

if "%choice%"=="3" (
    python proxy.py disable_system_proxy
    pause
    goto menu
)

if "%choice%"=="4" (
    python proxy.py set_git_proxy_to_clash_verge
    pause
    goto menu
)

if "%choice%"=="5" (
    python proxy.py remove_git_proxy
    pause
    goto menu
)

if "%choice%"=="6" (
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