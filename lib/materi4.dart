class Buku {
  final String judul;
  final String pengarang;
  final int tahunTerbit;

  Buku(this.judul, this.pengarang, this.tahunTerbit);
}

extension BukuExtension on Buku {
  bool isKlasik() => tahunTerbit < 2000;

  String get deskripsi => '$judul oleh $pengarang ($tahunTerbit)';
}


void main() {
  var mhs1 = Buku("Budi", "Andi", 2002);
  var mhs2 = Buku("Siti", "Enda", 1990);

  print("${mhs1.deskripsi} - klasik : ${mhs1.isKlasik()}");
  print("${mhs2.deskripsi} - klasik : ${mhs2.isKlasik()}");
}