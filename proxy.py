import winreg
import subprocess
import sys

def enable_system_proxy(proxy_address, proxy_port):
    proxy_string = f"{proxy_address}:{proxy_port}"
    proxy_enable = 1

    # 打开注册表路径
    reg_path = r"Software\Microsoft\Windows\CurrentVersion\Internet Settings"
    
    # 打开指定的注册表项
    with winreg.OpenKey(winreg.HKEY_CURRENT_USER, reg_path, 0, winreg.KEY_SET_VALUE) as reg_key:
        # 设置代理启用
        winreg.SetValueEx(reg_key, "ProxyEnable", 0, winreg.REG_DWORD, proxy_enable)
        
        # 设置代理服务器
        winreg.SetValueEx(reg_key, "ProxyServer", 0, winreg.REG_SZ, proxy_string)
    
    print(f"Proxy set to {proxy_string}")

def disable_system_proxy():
    # 打开注册表路径
    reg_path = r"Software\Microsoft\Windows\CurrentVersion\Internet Settings"
    
    # 打开指定的注册表项
    with winreg.OpenKey(winreg.HKEY_CURRENT_USER, reg_path, 0, winreg.KEY_SET_VALUE) as reg_key:
        # 设置代理禁用
        winreg.SetValueEx(reg_key, "ProxyEnable", 0, winreg.REG_DWORD, 0)
    
    print("Proxy disabled")

def set_git_proxy(proxy_address, proxy_port):
    proxy_url = f"http://{proxy_address}:{proxy_port}"
    # 配置HTTP代理
    subprocess.run(['git', 'config', '--global', 'http.proxy', proxy_url], check=True)
    # 配置HTTPS代理
    subprocess.run(['git', 'config', '--global', 'https.proxy', proxy_url], check=True)
    print("Git proxy has been configured successfully.")

def remove_git_proxy():
    # 移除HTTP代理
    subprocess.run(['git', 'config', '--global', '--unset', 'http.proxy'], check=True)
    # 移除HTTPS代理
    subprocess.run(['git', 'config', '--global', '--unset', 'https.proxy'], check=True)
    print("Git proxy has been removed successfully.")


# 配置信息
proxy_address = "192.168.31.46"
proxy_port = "7890"
git_proxy_address = "127.0.0.1"
git_proxy_port = "7890"

# 设置系统代理
if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] == "enable_system_proxy":
            enable_system_proxy(proxy_address, proxy_port)
        elif sys.argv[1] == "disable_system_proxy":
            disable_system_proxy()
        elif sys.argv[1] == "set_git_proxy":
            set_git_proxy(git_proxy_address, git_proxy_port)
        elif sys.argv[1] == "remove_git_proxy":
            remove_git_proxy()
    else:
        print("Please provide an argument.")
