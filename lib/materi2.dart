String? getNama({required String? nama}) {
  print("Hai $nama");
  return nama;
}

void main() {
  String? nama = getNama(nama: "Andi");

  if (nama != null) {
    print(nama.length);
  } else {
    print('Nama tidak tersedia');
  }
}
