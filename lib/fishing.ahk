fishingEnabled := false

!F4::fishingHandle()

fishingHandle() {
  global fishingEnabled
  
  if (fishingEnabled := !fishingEnabled) {
    SetTimer fishing, 1
  } else {
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
