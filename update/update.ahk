usr := "awbait"
repo := "next-helper"

#Include %A_ScriptDir%\lib\github.ahk

latestObj := Github.latest(usr, repo)

currentVersion := "0.0.1"
if currentVersion != latestObj.version 
{
    MsgBox "Time for an update, latest version is " 
    . latestObj.version " updated on " latestObj.date "`nNotes:`n" 
    . latestObj.change_notes "`n`nLink: " latestObj.DownloadURLs[1]
}