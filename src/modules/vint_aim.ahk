; Hotkeys
!F7::vintAimHandle()
Hotkey("~RButton", "Off")
Hotkey("~RButton Up", "Off")
Hotkey("X", "Off")

global toggle := 0
X:: {
  global toggle := !toggle
  if (toggle) {
    Loop 12 {
      MouseClick "WheelUp", , , 4
    }
  } else {
    Loop 12 {
      MouseClick "WheelDown", , , 4
    }
  }
}

~RButton:: {
  Hotkey("X", "On")
}

~RButton Up:: {
  global toggle
  toggle := 0
  Hotkey("X", "Off")
}

; Variables
vintAimEnabled := false

; Functions
vintAimHandle() {
  global vintAimEnabled
  
  if (vintAimEnabled := !vintAimEnabled) {
    Hotkey("~RButton", "On")
    Hotkey("~RButton Up", "On")
    wv.CoreWebView2.ExecuteScript("document.getElementById('vint_aim').className += ' enable'", 0)
  } else {
    Hotkey("~RButton", "Off")
    Hotkey("~RButton Up", "Off")
    Hotkey("X", "Off")
    wv.CoreWebView2.ExecuteScript("document.getElementById('vint_aim').classList.remove('enable')", 0)
  }
  return
}
