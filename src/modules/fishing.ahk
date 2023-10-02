fishingEnabled := false

^!F5::fishingHandle()

fishingHandle() {
  global fishingEnabled
  
  if (fishingEnabled := !fishingEnabled) {
    BlockInput "MouseMove"
    activeFunction(neutron, "fishing", true)
    SetTimer fishing, 300
  } else {
    BlockInput "MouseMoveOff"
    activeFunction(neutron, "fishing", false)
    SetTimer fishing, 0
  }
  return
}

fishing() {
  MouseClick "Left", 1267, 283
  Sleep 1
  MouseClick "Left", 636, 510
  Sleep 1
  MouseClick "Left", 968, 844
  Sleep 1
}
