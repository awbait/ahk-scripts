stateGui := Gui()
stateGui.SetFont("s8")

; Список возможностей
stateGui.Add("Text", "w900 cffffff", "[CTRL+F1] Показать/Скрыть")
stateGui.Add("Text", "w900 cffffff", "[CTRL+F3] Приготовить")
stateGui.Add("Text", "w900 cffffff", "[CTRL+F4] АвтоГотовка")
stateGui.Add("Text", "w900 cffffff", "[CTRL+F9] Закрыть скрипт")

; Указываем версию
stateGui.Add("Text", "w900 cffffff", "ver 0.0.7")

stateGui.Opt("+AlwaysOnTop -Caption +ToolWindow +E0x80020")
stateGui.BackColor := "232323"
WinSetTransColor("FF00FF" " 120", stateGui)
WinSetTransparent("120", stateGui)
stateGui.Show("w170 h110 x150 y150")

; Переменные
hideGui := false

; Показать/Скрыть интерфейс
^F1::showGui(stateGui)

showGui(myGui) {
  global hideGui
  if (hideGui) {
    myGui.Show("w170 h110 x150 y150")
    hideGui := false
  } else {
    myGui.Hide()
    hideGui := true
  }
}
