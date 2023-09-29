; Готовка
; При первом запуске ищем по картинкам координаты кнопок и записываем в конфигурационный файл

; Прекомпиляция изображений
FileInstall("./images/cooking/prigotovlenie.png", "prigotovlenie.png", 1)
FileInstall("./images/cooking/spaghetti_fanicini.png", "spaghetti_fanicini.png", 1)
FileInstall("./images/cooking/button_cook_idle.png", "button_cook_idle.png", 1)
FileInstall("./images/cooking/recipes.png", "recipes.png", 1)

; Конфигурационный файл
configFile := A_AppData "/HelperNextRP/config.ini"
stateTimerCooking := false

; Запуск одноразовой готовки
^F3::spaghettiCooking()
^F4::AutoSpaghettiCooking(stateTimerCooking)

AutoSpaghettiCooking(sT) {
  global stateTimerCooking
  if (sT) {
    SetTimer spaghettiCooking, 0
    stateTimerCooking := false
    ;stateText.Value := "Готовка: " stateTimerCooking
  } else {
    spaghettiCooking()
    SetTimer spaghettiCooking, 950000
    stateTimerCooking := true
    ;stateText.Value := "Готовка: " stateTimerCooking
  }
}

; Функция приготовления спагетти
spaghettiCooking() {
  sleepTime := 500

  ; Кнопка "Приготовление"
  prepCordX := IniRead(configFile, "cooking", "PreparationX", false)
  prepCordY := IniRead(configFile, "cooking", "PreparationY", false)
  if (!prepCordX) {
    ; Предполагаем, что запуск первый раз и устанавливаем задержку чуть больше
    sleepTime := 700

    preparation := 0
    while !preparation {
      preparation := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "prigotovlenie.png")
    }
    prepCordX := imgX + (150 / 2)
    prepCordY := imgY + (31 / 2)
    IniWrite prepCordX, configFile, "cooking", "PreparationX"
    IniWrite prepCordY, configFile, "cooking", "PreparationY"
  }
  MouseClick "left", prepCordX, prepCordY

  Sleep sleepTime

  ; Выбираем спагетти
  selectCordX := IniRead(configFile, "cooking", "SelectSpaghettiX", false)
  selectCordY := IniRead(configFile, "cooking", "SelectSpaghettiY", false)
  if (!selectCordX) {
    select := 0
    while !select {
      select := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "spaghetti_fanicini.png")
    }
    selectCordX := imgX + 400
    selectCordY := imgY + (23 / 2)
    IniWrite selectCordX, configFile, "cooking", "SelectSpaghettiX"
    IniWrite selectCordY, configFile, "cooking", "SelectSpaghettiY"
  }
  MouseClick "left", selectCordX, selectCordY

  Sleep sleepTime

  ; Готовить
  cookingCordX := IniRead(configFile, "cooking", "CookingX", false)
  cookingCordY := IniRead(configFile, "cooking", "CookingY", false)
  if (!cookingCordX) {
    cooking := 0
    while !cooking {
      cooking := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "button_cook_idle.png")
    }
    cookingCordX := imgX + (190 / 2)
    cookingCordY := imgY + (44 / 2)
    IniWrite cookingCordX, configFile, "cooking", "CookingX"
    IniWrite cookingCordY, configFile, "cooking", "CookingY"
  }
  MouseClick "left", cookingCordX, cookingCordY

  Sleep sleepTime

  ; Водим мышкой в право-влево в зависимости от смещения стрелки
  ; Держать мышку в указанных координатах
  StartX := 320
  EndX := 340

  Loop 15 {
      ; Переключаем направление
      SX := StartX
      EX := EndX

      MouseMove EX, 100

      Sleep 300

      StartX := EX
      EndX := SX
  }

  Sleep sleepTime

  ; 11 раз жмем ПКМ
  Loop 11 {
      MouseClick "right"
      Sleep 1
  }

  Sleep sleepTime

  ; 1 раз жмем ЛКМ
  MouseClick "left"

  Sleep sleepTime

  ; Возвращаемся на список рецептов
  recipesCordX := IniRead(configFile, "cooking", "RecipesX", false)
  recipesCordY := IniRead(configFile, "cooking", "RecipesY", false)
  if (!recipesCordX) {
    recipes := 0
    while !recipes {
      recipes := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "recipes.png")
    }
    recipesCordX := imgX + (172 / 2)
    recipesCordY := imgY + (29 / 2)
    IniWrite recipesCordX, configFile, "cooking", "RecipesX"
    IniWrite recipesCordY, configFile, "cooking", "RecipesY"
  }
  MouseClick "left", recipesCordX, recipesCordY
}
