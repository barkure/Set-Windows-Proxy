@echo off
chcp 65001
setlocal

:menu
cls
echo 请选择一个选项:
echo 1. 启用系统代理
echo 2. 禁用系统代理
echo 3. 设置Git代理
echo 4. 移除Git代理
echo 0. 退出

set /p choice=请输入选项编号: 

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

if "%choice%"=="0" (
    exit
)

echo 无效的选项，请重新输入。
pause
goto menu