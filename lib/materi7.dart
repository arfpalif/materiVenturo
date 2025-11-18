import 'dart:io';

enum Nilai {
  A("Lulus dengan pujian 🎓", "Keren banget! Pertahankan prestasimu!"),
  B("Lulus", "Bagus! Tingkatkan lagi!"),
  C("Lulus", "Masih aman, tapi coba lebih fokus ya!"),
  D("Remedial", "Jangan menyerah! Kamu pasti bisa mengejar!"),
  E("Tidak lulus", "Ayo bangkit lagi! Mulai pelan-pelan, pasti bisa!");

  final String status;
  final String motivasi;

  const Nilai(this.status, this.motivasi);
}



void main() {
  print("Masukkan nilai Anda:");
  int? NilaiInt = int.parse(stdin.readLineSync()!);
  print("Nilai Anda adalah: $NilaiInt");  

  Nilai nilai;
  if (NilaiInt < 0 || NilaiInt > 100) {
    print("Nilai tidak valid. Harap masukkan nilai antara 0 hingga 100.");
    return;
  }
  if (NilaiInt >= 90) {
    nilai = Nilai.A;
  } else if (NilaiInt >= 70) {
    nilai = Nilai.B;
  } else if (NilaiInt >= 60) {
    nilai = Nilai.C;
  } else if (NilaiInt >= 50) {
    nilai = Nilai.D;
  } else {
    nilai = Nilai.E;
  }

  switch (nilai) {
    case Nilai.A:
      print("Anda mendapatkan nilai A");
      print(Nilai.A.status);
      print(Nilai.A.motivasi);
      break;
    case Nilai.B:
      print("Anda mendapatkan nilai B");
      print(Nilai.B.status);
      print(Nilai.B.motivasi);
      break;
    case Nilai.C:
      print("Anda mendapatkan nilai C");
      print(Nilai.C.status);
      print(Nilai.C.motivasi);
      break;
    case Nilai.D:
      print("Anda mendapatkan nilai D");
      print(Nilai.D.status);
      print(Nilai.D.motivasi);
      break;
    case Nilai.E:
      print("Anda mendapatkan nilai E");
      print(Nilai.E.status);
      print(Nilai.E.motivasi);
      break;
  }
}
