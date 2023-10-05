;@Ahk2Exe-Base C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe

#SingleInstance Force

; Интерфейс
FileInstall("index.html", "*")
FileInstall("style.css", "*")

; Прекомпиляция изображений
FileInstall("../images/cooking/prigotovlenie.png", "prigotovlenie.png", 1)
FileInstall("../images/cooking/spaghetti_fanicini.png", "spaghetti_fanicini.png", 1)
FileInstall("../images/cooking/button_cook_idle.png", "button_cook_idle.png", 1)
FileInstall("../images/cooking/recipes.png", "recipes.png", 1)

; Zakaz
FileInstall("../images/cooking/zakaz.png", "zakaz.png", 1)
FileInstall("../images/cooking/scroll.png", "scroll.png", 1)
FileInstall("../images/cooking/carrot.png", "carrot.png", 1)
FileInstall("../images/cooking/onion.png", "onion.png", 1)
FileInstall("../images/cooking/spaghetti.png", "spaghetti.png", 1)
FileInstall("../images/cooking/cheese.png", "cheese.png", 1)
FileInstall("../images/cooking/cream.png", "cream.png", 1)
FileInstall("../images/cooking/buy.png", "buy.png", 1)

; libs
#Include libs\Neutron.ahk
#Include libs\utils.ahk

; scripts
#Include gui.ahk
#Include modules\double_jump.ahk
#Include modules\fishing.ahk
#Include modules\cooking.ahk
#Include modules\close.ahk
