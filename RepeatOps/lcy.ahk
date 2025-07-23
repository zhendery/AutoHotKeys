#Requires AutoHotkey v2.0

Esc::ExitApp

SetTimer(PressKeys, 3500)

PressKeys() {
    Send("{F5}")
    Sleep(100)
    Send("{Enter}")
}