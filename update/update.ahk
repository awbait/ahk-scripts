#Include %A_ScriptDir%\lib\github.ahk

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

