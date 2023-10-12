class BeratManager {
  double berat = 0.0;
  double harga = 0.0;

  void tambahBerat() {
    berat += 1.0;
  }

  void kurangiBerat() {
    if (berat > 0.0) {
      berat -= 1.0;
    }
  }

  void editHarga(double newHarga) {
    harga = newHarga;
  }
}
