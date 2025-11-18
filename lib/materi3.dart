import 'dart:async';

Stream<int> getNama() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  getNama().listen(
    (angka) {
      if (angka == 3) {
        print('tengah $angka');
      }
      else if(angka == 5){
        print('selesai $angka');
      }
      else{
        print('Memproses angka: $angka');
      }
    },
    onError: (error) {
      print('Terjadi kesalahan: $error');
    },
    onDone: () {
      print('Selesai mengambil data angka.');
    });
}

