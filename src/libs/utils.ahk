findPixel(x1, y1, x2, y2, color, variation) {
  if PixelSearch(&Px, &Py, x1, y1, x2, y2, color, variation) {
    return {px: Px, py: Py}
  }
  return false
}
