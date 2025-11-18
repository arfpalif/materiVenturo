enum TingkatBahaya {
  rendah("Hijau"),
  sedang("Kuning"),
  tinggi("Merah");

  final String warna;

  const TingkatBahaya(this.warna);

  void peringatan() {
    print("Tingkat bahaya: $name - Warna: $warna");
  }
}

void main() {
  final bahaya = TingkatBahaya.tinggi;
  bahaya.peringatan(); 
}
