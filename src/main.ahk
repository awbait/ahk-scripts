;@Ahk2Exe-Base C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe

#Requires AutoHotkey v2.0
#SingleInstance Force

; Variables
homeDir := A_AppData '/NextHelper'
configFile := homeDir '/config.ini'

; Install all dependencies
DirCreate homeDir "/html"
FileInstall('./html/index.html', './html/index.html', 1)
FileInstall('./html/style.css', './html/style.css', 1)

DirCreate homeDir "/libs"
FileInstall('./libs/WebView2/64bit/WebView2Loader.dll', './libs/WebView2Loader.dll', 1)

DirCreate homeDir '/img'
DirCreate homeDir '/img/cooking'
FileInstall("../img/cooking/prigotovlenie.png", homeDir "/img/cooking/prigotovlenie.png", 1)
FileInstall("../img/cooking/spaghetti_fanicini.png", homeDir "/img/cooking/spaghetti_fanicini.png", 1)
FileInstall("../img/cooking/button_cook_idle.png", homeDir "/img/cooking/button_cook_idle.png", 1)
FileInstall("../img/cooking/recipes.png", homeDir "/img/cooking/recipes.png", 1)

; Zakaz
FileInstall("../img/cooking/zakaz.png", homeDir "/img/cooking/zakaz.png", 1)
FileInstall("../img/cooking/scroll.png", homeDir "/img/cooking/scroll.png", 1)
FileInstall("../img/cooking/carrot.png", homeDir "/img/cooking/carrot.png", 1)
FileInstall("../img/cooking/onion.png", homeDir "/img/cooking/onion.png", 1)
FileInstall("../img/cooking/spaghetti.png", homeDir "/img/cooking/spaghetti.png", 1)
FileInstall("../img/cooking/cheese.png", homeDir "/img/cooking/cheese.png", 1)
FileInstall("../img/cooking/cream.png", homeDir "/img/cooking/cream.png", 1)
FileInstall("../img/cooking/buy.png", homeDir "/img/cooking/buy.png", 1)

; Install bot modules
#Include gui.ahk
#Include modules\close.ahk
#Include modules\fishing.ahk
#Include modules\double_jump.ahk
#Include modules\exit_game.ahk
#Include modules\cooking.ahk
