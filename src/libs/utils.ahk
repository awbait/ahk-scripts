
findPixel(x1, y1, x2, y2, color, variation) {
  if PixelSearch(&Px, &Py, x1, y1, x2, y2, color, variation) {
    return {px: Px, py: Py}
  }
  return false
}

findOnePixel(condition) {
  if (condition)
      return {key1: "Value1", key2: "Value2"}
  else
      return false
}