; Hotkeys
!F6::doubleJumpHandle()
Hotkey("*~$Space", "Off")

*~$Space::{
  Sleep 5
  Loop
  {
    spaceState := GetKeyState("Space", "P")
    if !spaceState
    break
    Sleep 1
    SendInput "{Blind}{Space}"
  }
  Return
}

; Variables
doubleJumpEnabled := false

; Functions
doubleJumpHandle() {
  global doubleJumpEnabled
  
  if (doubleJumpEnabled := !doubleJumpEnabled) {
    Hotkey("*~$Space", "On")
    wv.CoreWebView2.ExecuteScript("document.getElementById('double_jump').className += ' enable'", 0)
  } else {
    Hotkey("*~$Space", "Off")
    wv.CoreWebView2.ExecuteScript("document.getElementById('double_jump').classList.remove('enable')", 0)
  }
  return
}
