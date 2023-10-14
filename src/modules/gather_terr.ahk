; Hotkeys
!T::collectTerritory

collectTerritory() {
  /* Нажимаем H */
  Send "{h}"
  Sleep 100

  /* Определение координат поиска кнопки "собрать" */
  searchWidth := 900
  searchHeight := 150
  searchX := (A_ScreenWidth - searchWidth) // 2
  searchY := (A_ScreenHeight // 2) + 200

  ; Поиск
  pixel := findPixel(searchX, searchY, searchX + searchWidth, searchY + searchHeight, 0x22b765, 3) 

  ; Если не найден = скипаем
  if !pixel
    return

  /* Кнопка собрать найдена - жмем */
  MouseClick("Left", pixel.px + 10, pixel.py + 10)
  Sleep 100

  /* Закрываем окно сбора */
  Send "{ESC}"
}
