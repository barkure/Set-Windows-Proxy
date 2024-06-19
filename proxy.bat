@echo off
chcp 65001
setlocal

:menu
cls
echo 请选择一个选项:
echo 1. 配置系统使用 OPI 代理
echo 2. 禁用系统代理
echo 3. 设置Git代理
echo 4. 移除Git代理
echo 5. 显示当前Git代理设置
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

if "%choice%"=="5" (
    echo 当前HTTP代理设置:
    git config --global http.proxy
    echo 当前HTTPS代理设置:
    git config --global https.proxy
    pause
    goto menu
)

if "%choice%"=="0" (
    exit
)

echo 无效的选项，请重新输入。
pause
goto menu