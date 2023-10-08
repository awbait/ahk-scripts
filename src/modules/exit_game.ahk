VK24::closeGame

closeGame() {
  if (PID := ProcessExist("gta_sa.exe")) {
    ProcessClose(PID)
  }
}
