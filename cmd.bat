@echo off

"C:/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe" /in "./src/main.ahk" /out "../build/helper.exe" /icon "C:/work/next-helper/images/logo.ico"
"C:/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe" /in "./launcher/launcher.ahk" /out "../build/launcher.exe" /icon "C:/work/next-helper/images/logo.ico"
