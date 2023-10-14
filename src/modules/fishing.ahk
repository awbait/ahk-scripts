; Hotkeys
^!F5::fishingHandle()

; Variables
fishingEnabled := false

SetControlDelay -1

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
  gameTitle := "NEXTRP"
  uid := WinExist(gameTitle)
  if uid {
    ; ControlClick("x1267 y283", "ahk_class Grand theft auto San Andreas",, "Left",, "Pos")
    ; ControlClick("x1267 y283", gameTitle,, "Left")
    MouseClick "Left", 1267, 283
    Sleep 1
    ; ControlClick("x636 y510", "ahk_class Grand theft auto San Andreas",, "Left",, "Pos")
    ; ControlClick("x636 y510", gameTitle,, "Left")
    MouseClick "Left", 636, 510
    Sleep 1
    ; ControlClick("x968 y844", "ahk_class Grand theft auto San Andreas",, "Left",, "Pos")
    ; ControlClick("x968 y844", gameTitle,, "Left")
    MouseClick "Left", 968, 844
    Sleep 1
  }
}
