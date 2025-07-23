A_IconTip := "测试工具"       ; 悬浮提示文本
TraySetIcon("E:/Resources/Icons/datas.ico")  ; 设置托盘图标

; 定义托盘菜单项
A_TrayMenu.Delete()  ; 清空默认菜单
A_TrayMenu.Add("选项1", (*) => MsgBox("111"))  ; 添加选项1
A_TrayMenu.Add("退出", (*) => ExitApp())        ; 添加退出选项

; 左键点击托盘图标弹出菜单
OnMessage(0x404, (wp, lp, *) => (lp = 0x201 && A_TrayMenu.Show()))  ; 0x201为左键按下事件

Persistent  ; 保持脚本持续运行