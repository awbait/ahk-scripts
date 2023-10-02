; Прекомпиляция изображений
FileInstall("./images/cooking/prigotovlenie.png", "prigotovlenie.png", 1)
FileInstall("./images/cooking/spaghetti_fanicini.png", "spaghetti_fanicini.png", 1)
FileInstall("./images/cooking/button_cook_idle.png", "button_cook_idle.png", 1)
FileInstall("./images/cooking/recipes.png", "recipes.png", 1)
; Zakaz
FileInstall("./images/cooking/zakaz.png", "zakaz.png", 1)
FileInstall("./images/cooking/scroll.png", "scroll.png", 1)
FileInstall("./images/cooking/carrot.png", "carrot.png", 1)
FileInstall("./images/cooking/onion.png", "onion.png", 1)
FileInstall("./images/cooking/spaghetti.png", "spaghetti.png", 1)
FileInstall("./images/cooking/cheese.png", "cheese.png", 1)
FileInstall("./images/cooking/cream.png", "cream.png", 1)
FileInstall("./images/cooking/buy.png", "buy.png", 1)

; HTML
FileInstall("./html/index.html", "index.html", 1)
FileInstall("./html/style.css", "style.css", 1)

; Функция добавления класса enable
activeFunction(neutron, funcId, state) {
  keyDiv := neutron.doc.querySelectorAll("#" . funcId)

  for i, div in NeutronWindow.Each(keyDiv) {
    if(state) {
      div.className := div.className " enable"
    } else {
      text := StrReplace(div.className, "enable", "")
      div.className := text
    }
  }
}