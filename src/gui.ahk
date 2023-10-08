neutron := NeutronWindow()
  .Load("index.html")
neutron.Opt("+AlwaysOnTop +Caption +ToolWindow +LastFound +E0x80020")

posX := A_ScreenWidth - 180 - 250
posY := A_ScreenHeight - 180 - 50

stringPosition := "w180 h194 x" posX " y" posY

neutron.Show(stringPosition)
WinSetTransparent("255", neutron)

; Показать/Скрыть интерфейс
F3::showGui(neutron)

hideGui := false

showGui(myGui) {
  global hideGui
  if (hideGui) {
    myGui.Show(stringPosition)
    hideGui := false
  } else {
    myGui.Hide()
    hideGui := true
  }
}

