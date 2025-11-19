//With class Buku encapsulation
class Buku {
  // Properti dengan enkapsulasi menggunakan getter dan setter
  String _judul;
  String _penulis;
  int _tahunTerbit;

  // Konstruktor
  Buku(this._judul, this._penulis, this._tahunTerbit);

  // Getter
  String get merk => _judul;
  String get warna => _penulis;
  int get tahunTerbit => _tahunTerbit;

  // Setter
  set judul(String judulBaru) {
    if (judulBaru.isNotEmpty) {
      _judul = judulBaru;
    }
  }

  set penulis(String penulisBaru) {
    _penulis = penulisBaru;
  }

  set tahunTerbit(String tahunTerbitBaru) {
    _penulis = tahunTerbitBaru;
  }

  // Metode
  void bergerak() {
    print('$_judul $_penulis $tahunTerbit sudah terbit.');
  }
}

//With polymorphism
abstract class Hewan {
  void bersuara(); // Metode abstrak yang wajib diimplementasikan oleh kelas turunan
}

class Anjing extends Hewan {
  @override
  void bersuara() {
    print('Gukguk');
  }
}

class Kucing extends Hewan {
  @override
  void bersuara() {
    print('Meong');
  }
}

//Main function
void main() {
  var mobil1 = Buku('Joko', 'Widodo', 2020);
  mobil1.bergerak(); // Output: Toyota Merah sedang bergerak.

  // Mengubah nilai menggunakan setter
  mobil1.judul = 'Honda';
  mobil1.penulis = 'Hitam';
  mobil1.bergerak(); // Output: Honda Hitam sedang bergerak.

  var hewan1 = Anjing();
  var hewan2 = Kucing();

  hewan1.bersuara(); // Output: Mobil sedang bergerak.
  hewan2.bersuara(); // Output: Sepeda sedang bergerak.
}
