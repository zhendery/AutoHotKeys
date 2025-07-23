#Requires AutoHotkey v2.0

A_IconTip := "工具"       ; 悬浮提示文本
TraySetIcon("E:/Resources/Icons/datas.ico")  ; 设置托盘图标

; 定义托盘菜单项
A_TrayMenu.Delete()  ; 清空默认菜单
A_TrayMenu.Add("切换浏览器", (*) => Run("ms-settings:defaultapps"))
A_TrayMenu.Add
A_TrayMenu.Add("退出", (*) => ExitApp())


Persistent  ; 保持脚本持续运行