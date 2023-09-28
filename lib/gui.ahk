stateGui := Gui()
stateGui.SetFont("s8")

; Список возможностей
stateGui.Add("Text", "w900 cffffff", "[CTRL+F1] Показать/Скрыть")
stateGui.Add("Text", "w900 cffffff", "[CTRL+F3] Приготовить")

; Указываем версию
stateGui.Add("Text", "w900 cffffff", "ver 0.0.5")

stateGui.Opt("+AlwaysOnTop -Caption +ToolWindow +E0x80020")
stateGui.BackColor := "232323"
WinSetTransColor("FF00FF" " 120", stateGui)
WinSetTransparent("120", stateGui)
stateGui.Show("w170 h70 x150 y150")

;stateAutoCookingText := stateGui.Add("Text", "w900 cffffff", "[CTRL+F2] АвтоГотовка: OFF")

;stateGui.Add("Text", "w900 cffffff", "[CTRL+F4] Репорт")
;stateGui.Add("Text", "w900 cffffff", "[INS] Закрыть игру")
