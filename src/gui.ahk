#Include libs\WebView2\WebView2.ahk

g := Gui()
g.Opt("+AlwaysOnTop -Caption +ToolWindow +E0x80020")

; Определяем позицию и размеры окна
posX := A_ScreenWidth - 180 - 250
posY := A_ScreenHeight - 180 - 50
stringPosition := Format("w{} h{} x{} y{}", 190, 199, posX, posY)

; Отобразить интерфейс
g.Show("NoActivate " stringPosition)
wv := WebView2.create(g.Hwnd,,,,,,"./libs/WebView2Loader.dll")
wv.CoreWebView2.Navigate('file:///' A_ScriptDir '/html/index.html')

; Показать/Скрыть интерфейс
F3::showGui(g)

hideGui := false

showGui(myGui) {
  global hideGui
  if (hideGui) {
    myGui.Show("NoActivate " stringPosition)
    hideGui := false
  } else {
    myGui.Hide()
    hideGui := true
  }
}
