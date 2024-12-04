; 特殊游戏cpu锁频防止过热

HK_PATH := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar"
HK_NAME := "AutoGameModeEnabled"
APPLICATIONS_NAME := [
    'b1-Win64-Shipping.exe',
    'portal2.exe',
]

SetTimer(CheckProcess, 1000)

ProcessExists() {
    for i in APPLICATIONS_NAME {
        if (ProcessExist(i))
            return true
    }
    return false
}

CheckProcess() {
    value := RegRead(HK_PATH, HK_NAME)
    if (value == 1) {
        if (ProcessExists()) {
            RegWrite(0, "REG_DWORD", HK_PATH, HK_NAME)
            Run('C:\Windows\System32\powercfg.exe setactive 8d8fe93a-be3e-4446-9f66-1f4c94858e0f') ; 节能降温
        }
    } else {
        if (!ProcessExists()) {
            RegWrite(1, "REG_DWORD", HK_PATH, HK_NAME)
            Run('C:\Windows\System32\powercfg.exe setactive 381b4222-f694-41f0-9685-ff5bb260df2e') ; 平衡
        }
    }
}
