#Requires AutoHotkey v2.0

A_IconTip := "工具"       ; 悬浮提示文本
TraySetIcon("E:/Resources/Icons/datas.ico")  ; 设置托盘图标

; 定义托盘菜单项
A_TrayMenu.Delete()  ; 清空默认菜单
A_TrayMenu.Add("QQ刷字符", QQShuaZifu)
A_TrayMenu.Add
A_TrayMenu.Add("切换浏览器", (*) => Run("ms-settings:defaultapps"))
A_TrayMenu.Add
A_TrayMenu.Add("退出", (*) => ExitApp())

QQShuaZifu(*){
    SetTitleMatchMode 2  ; 窗口标题部分匹配
    if !WinWaitActive("ahk_exe QQ.exe", , 3) {
        MsgBox "等待QQ窗口超时！"
    }

    Loop 29 {
        Send "{Text}" A_Index
        Send("{Enter}")
        Sleep 300 + Random(-100, 100)
    }
    MsgBox "数字输入完成！"
}


Persistent  ; 保持脚本持续运行