@echo off

"C:/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe" /in "helper.ahk" /out "./build/helper.exe" /icon "C:/work/next-helper/images/logo.ico"
"C:/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe" /in "./launcher/launcher.ahk" /out "../build/launcher.exe" /icon "C:/work/next-helper/images/logo.ico"
<<<<<<< HEAD
=======

cmd.exe /k "signtool.exe sign /f HelperNextrp.pfx /fd sha1 /p 123456 ./build/launcher.exe" x86

pause
>>>>>>> fcd6f843187e8f57bbb8e55f3be32b42cf8a4f5a
