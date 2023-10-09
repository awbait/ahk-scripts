; Hotkeys
^!F5::fishingHandle()

; Variables
fishingEnabled := false

; Functions
fishingHandle() {
  global fishingEnabled
  
  if (fishingEnabled := !fishingEnabled) {
    BlockInput "MouseMove"
    wv.CoreWebView2.ExecuteScript("document.getElementById('fishing').className += ' enable'", 0)
    SetTimer fishing, 300
  } else {
    BlockInput "MouseMoveOff"
    wv.CoreWebView2.ExecuteScript("document.getElementById('fishing').classList.remove('enable')", 0)
    SetTimer fishing, 0
  }
  return
}

fishing() {
  MouseClick "Left", 1267, 283
  Sleep 1
  MouseClick "Left", 636, 510
  Sleep 1
  MouseClick "Left", 968, 844
  Sleep 1
}
