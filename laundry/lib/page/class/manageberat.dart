class BeratManager {
  double berat = 1.0;

  void tambahBerat() {
    berat += 1.0;
  }

  void kurangiBerat() {
    if (berat > 1.0) {
      berat -= 1.0;
    }
  }
}
