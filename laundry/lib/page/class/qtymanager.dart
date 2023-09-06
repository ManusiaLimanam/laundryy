class QtyManager {
  int qty = 1;

  void tambahQty() {
    qty += 1;
  }

  void kurangiQty() {
    if (qty > 1) {
      qty -= 1;
    }
  }
}
