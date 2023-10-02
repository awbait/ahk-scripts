doubleJumpEnabled := false

!F6::doubleJumpHandle()
Hotkey("*~$Space", "Off")

doubleJumpHandle() {
  global doubleJumpEnabled
  
  if (doubleJumpEnabled := !doubleJumpEnabled) {
    Hotkey("*~$Space", "On")
    activeFunction(neutron, "double_jump", true)
  } else {
    Hotkey("*~$Space", "Off")
    activeFunction(neutron, "double_jump", false)
  }
  return
}

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
