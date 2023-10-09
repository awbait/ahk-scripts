; Hotkeys
VK24::closeGame

; Functions
closeGame() {
  if (PID := ProcessExist("gta_sa.exe")) {
    ProcessClose(PID)
  }
}
