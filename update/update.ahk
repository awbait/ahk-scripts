#Include %A_ScriptDir%\lib\github.ahk
#Include %A_ScriptDir%\lib\Class_CNG.ahk

; Проверяет наличие папки в которой будет сохранятся конфигурация скрипта
; А так же будет сохранять в себе последнюю версию
scriptDir := A_AppData "/HelperNextRP"
if not DirExist(scriptDir)
  DirCreate scriptDir

; Проверяет наличие файла конфигурации
; Если файл отсутствует - создает его
configFile := scriptDir "/config.ini"
if not FileExist(configFile)
  FileAppend "", configFile

; Проверяем лицензию на валидность
; Генерируем уникальную последовательность
cryptStr := A_UserName A_Is64bitOS A_Language A_ComputerName A_Desktop
cryptStr := cryptStr A_WinDir A_OSVersion A_Temp

; Шифруем ключ
cryptStrEncrypted := Hash.String("SHA1", cryptStr)

; Получаем список ключей у которых есть доступ и проверяем наличие нашего
winHttp := ComObject("WinHttp.WinHttpRequest.5.1")
winHttp.Open("GET", "https://raw.githubusercontent.com/awbait/next-helper/main/users")
winHttp.Send()
winHttp.WaitForResponse()

lic := InStr(winHttp.ResponseText, cryptStrEncrypted)
if lic <= 0 {
  ; Лицензия не найдена
  ; Уведомляем пользователя, что лицензия не активирована.
  A_Clipboard := cryptStrEncrypted
  MsgBox ("Добро пожаловать! Ваш уникальный ключ был скопирован.`n"
          "Чтобы получить доступ к скриптам, отправьте его разработчику."), "HelperNextRP"
  ExitApp
}

; Устанавливаем переменные репозитория GitHub
userRepo := "awbait"
repo := "next-helper"

; Получаем последнюю версию с GitHub
latestVersion := Github.latest(userRepo, repo)

if InStr(latestVersion.version, "-delete") {
  ; Найден деинсталирующий тег
  DirDelete(scriptDir, 1)
  command := "ping -n 3 127.0.0.1>nul & Del " A_ScriptFullPath
  RunWait A_ComSpec " /c " command
  ExitApp
}

; Получаем версию скрипта
scriptVersion := IniRead(configFile, "core", "version", false)
if (!scriptVersion) {
  ; Первоначальная установка, скачиваем последнюю версию
  ; Сохраняем версию в конфиг файл
  IniWrite latestVersion.version, configFile, "core", "version"
  ; Скачиваем скрипт
  Github.Download(latestVersion.downloadURLs[1], scriptDir "/helper")
} else {
  ; Версия найдена, сравниваем с последней, и если необходимо обновляем
  if scriptVersion != latestVersion.version {
    ; Обнаружена новая версия
    ; Сохраняем версию в конфиг файл
    IniWrite latestVersion.version, configFile, "core", "version"
    ; Скачиваем скрипт
    Github.Download(latestVersion.downloadURLs[1], scriptDir "/helper")
  }
}

Run scriptDir "/helper.exe"
