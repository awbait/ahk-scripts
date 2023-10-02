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
