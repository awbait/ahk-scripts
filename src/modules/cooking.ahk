; Готовка
; При первом запуске ищем по картинкам координаты кнопок и записываем в конфигурационный файл

; Конфигурационный файл
configFile := A_AppData "/HelperNextRP/config.ini"
stateTimerCooking := false

; Запуск одноразовой готовки
!F4::spaghettiCooking()
!F5::zakupka()
^!F4::AutoSpaghettiCooking(stateTimerCooking)

AutoSpaghettiCooking(sT) {
  global stateTimerCooking
  if (sT) {
    BlockInput "MouseMoveOff"
    activeFunction(neutron, "cooking", false)
    SetTimer spaghettiCooking, 0
    SetTimer zakupka, 0
    stateTimerCooking := false
  } else {
    BlockInput "MouseMove"
    activeFunction(neutron, "cooking", true)
    spaghettiCooking()
    Sleep 10000
    zakupka()
    SetTimer spaghettiCooking, 16 * 60000
    SetTimer zakupka, 61 * 60000
    stateTimerCooking := true
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

zakupka() {
  sleepTime := 500

  ; Кнопка "Заказ"
  zakazCordX := IniRead(configFile, "cooking", "ZakazX", false)
  zakazCordY := IniRead(configFile, "cooking", "ZakazY", false)
  if (!zakazCordX) {
    ; Предполагаем, что запуск первый раз и устанавливаем задержку чуть больше
    sleepTime := 700

    zakaz := 0
    while !zakaz {
      zakaz := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "zakaz.png")
    }
    zakazCordX := imgX + (152 / 2)
    zakazCordY := imgY + (24 / 2)
    IniWrite zakazCordX, configFile, "cooking", "ZakazX"
    IniWrite zakazCordY, configFile, "cooking", "ZakazY"
  }
  MouseClick "left", zakazCordX, zakazCordY

  Sleep sleepTime

  ; Ищем координаты скролла
  zakazScrollCordX := IniRead(configFile, "cooking", "ZakazScrollX", false)
  zakazScrollCordY := IniRead(configFile, "cooking", "ZakazScrollY", false)
  zakazScrollCordYEnd := IniRead(configFile, "cooking", "ZakazScrollEndY", false)
  if (!zakazScrollCordX) {
    scroll := 0
    while !scroll {
      scroll := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "scroll.png")
    }
    zakazScrollCordX := imgX + (16 / 2)
    zakazScrollCordY := imgY + (24 / 2)
    zakazScrollCordYEnd := zakazScrollCordY + 254
    IniWrite zakazScrollCordX, configFile, "cooking", "ZakazScrollX"
    IniWrite zakazScrollCordY, configFile, "cooking", "ZakazScrollY"
    IniWrite zakazScrollCordYEnd, configFile, "cooking", "ZakazScrollEndY"
  }
  
  ; Зажимаем ЛКМ кнопку на скролле и скроллим вниз
  Sleep 100
  SendInput "{Click " zakazScrollCordX " " zakazScrollCordY " Down}"
  Sleep 1
  MouseMove zakazScrollCordX, zakazScrollCordYEnd
  Sleep 1
  SendInput "{Click " zakazScrollCordX " " zakazScrollCordYEnd " Up}"
  Sleep 100
  
  Sleep sleepTime

  ; Прожимаем кнопки закупки продукции по 3 раза
  ; Морковка
  zakazCarrotCordX := IniRead(configFile, "cooking", "ZakazCarrotX", false)
  zakazCarrotCordY := IniRead(configFile, "cooking", "ZakazCarrotY", false)
  if (!zakazCarrotCordX) {
    carrot := 0
    while !carrot {
      carrot := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "carrot.png")
    }
    zakazCarrotCordX := imgX + 900
    zakazCarrotCordY := imgY + (38 / 2)
    IniWrite zakazCarrotCordX, configFile, "cooking", "ZakazCarrotX"
    IniWrite zakazCarrotCordY, configFile, "cooking", "ZakazCarrotY"
  }
  loop 3 {
    MouseClick "left", zakazCarrotCordX, zakazCarrotCordY
    Sleep 100
  }

  Sleep sleepTime

  ; Лук
  zakazOnionCordX := IniRead(configFile, "cooking", "ZakazOnionX", false)
  zakazOnionCordY := IniRead(configFile, "cooking", "ZakazOnionY", false)
  if (!zakazOnionCordX) {
    onion := 0
    while !onion {
      onion := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "onion.png")
    }
    zakazOnionCordX := imgX + 900
    zakazOnionCordY := imgY + (38 / 2)
    IniWrite zakazOnionCordX, configFile, "cooking", "ZakazOnionX"
    IniWrite zakazOnionCordY, configFile, "cooking", "ZakazOnionY"
  }
  loop 3 {
    MouseClick "left", zakazOnionCordX, zakazOnionCordY
    Sleep 100
  }

  Sleep sleepTime

  ; Спагетти
  zakazSpaghettiCordX := IniRead(configFile, "cooking", "ZakazSpaghettiX", false)
  zakazSpaghettiCordY := IniRead(configFile, "cooking", "ZakazSpaghettiY", false)
  if (!zakazSpaghettiCordX) {
    spaghetti := 0
    while !spaghetti {
      spaghetti := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "spaghetti.png")
    }
    zakazSpaghettiCordX := imgX + 900
    zakazSpaghettiCordY := imgY + (38 / 2)
    IniWrite zakazSpaghettiCordX, configFile, "cooking", "ZakazSpaghettiX"
    IniWrite zakazSpaghettiCordY, configFile, "cooking", "ZakazSpaghettiY"
  }
  loop 3 {
    MouseClick "left", zakazSpaghettiCordX, zakazSpaghettiCordY
    Sleep 100
  }

  Sleep sleepTime

  ; Сыр
  zakazCheeseCordX := IniRead(configFile, "cooking", "ZakazCheeseX", false)
  zakazCheeseCordY := IniRead(configFile, "cooking", "ZakazCheeseY", false)
  if (!zakazCheeseCordX) {
    cheese := 0
    while !cheese {
      cheese := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "cheese.png")
    }
    zakazCheeseCordX := imgX + 900
    zakazCheeseCordY := imgY + (38 / 2)
    IniWrite zakazCheeseCordX, configFile, "cooking", "ZakazCheeseX"
    IniWrite zakazCheeseCordY, configFile, "cooking", "ZakazCheeseY"
  }
  loop 3 {
    MouseClick "left", zakazCheeseCordX, zakazCheeseCordY
    Sleep 100
  }

  Sleep sleepTime
  
  ; Сливки
  zakazCreamCordX := IniRead(configFile, "cooking", "ZakazCreamX", false)
  zakazCreamCordY := IniRead(configFile, "cooking", "ZakazCreamY", false)
  if (!zakazCreamCordX) {
    cream := 0
    while !cream {
      cream := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "cream.png")
    }
    zakazCreamCordX := imgX + 900
    zakazCreamCordY := imgY + (38 / 2)
    IniWrite zakazCreamCordX, configFile, "cooking", "ZakazCreamX"
    IniWrite zakazCreamCordY, configFile, "cooking", "ZakazCreamY"
  }
  loop 3 {
    MouseClick "left", zakazCreamCordX, zakazCreamCordY
    Sleep 100
  }

  Sleep sleepTime

  ; Купить
  buyCordX := IniRead(configFile, "cooking", "BuyX", false)
  buyCordY := IniRead(configFile, "cooking", "BuyY", false)
  if (!buyCordX) {
    buy := 0
    while !buy {
      buy := ImageSearch(&imgX, &imgY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 " "buy.png")
    }
    buyCordX := imgX + (118 / 2)
    buyCordY := imgY + (46 / 2)
    IniWrite buyCordX, configFile, "cooking", "BuyX"
    IniWrite buyCordY, configFile, "cooking", "BuyY"
  }
  MouseClick "left", buyCordX, buyCordY

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
