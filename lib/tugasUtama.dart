import 'dart:async';

enum StatusAc { aktif, nonAktif,}

class Ac{
  String brand;
  double _suhu;
  Enum status;
  List _riwayatSuhu;
  StreamController<double> _suhuStream = StreamController<double>.broadcast();

  Ac(this.brand, this._suhu, this.status, this._riwayatSuhu, this._suhuStream);

  double get suhu => _suhu;
  List get riwayatSuhu => _riwayatSuhu; 
  StreamController get suhuStream => _suhuStream;
  set suhu(double suhuBaru) {
    _suhu = suhuBaru;
  }
  
  hidupkan() {
    status = StatusAc.aktif;
    print("AC $brand dinyalakan");
  }
  matikan() {
    status = StatusAc.nonAktif;
    print("AC $brand dimatikan");
  }
  Future<double> aturSuhu(double suhuBaru) async {
    await Future.delayed(Duration(seconds: 2));
    _suhu = suhuBaru;
    if(suhuBaru >= 28 ){
      print("Peringatan: Suhu $suhuBaru terlalu tinggi!");
      await Future.delayed(Duration(seconds: 1));
      _suhu = 24.0;
      print("Suhu AC $brand diatur ulang ke $_suhu°C");
      _riwayatSuhu.add(_suhu);
      _suhuStream.add(_suhu);
    }
    return _suhu;
  }
  notifikasiSuhu() {
    _suhuStream.stream.listen((suhu) {
      print(">> Notifikasi: Suhu AC $brand berubah menjadi $suhu°C");
    });
  }
  tampilkanRiwayatSuhu() {
    print("Riwayat suhu AC $brand: $_riwayatSuhu");
  }
  suhuTerakhir(){
    print("Suhu terakhir AC $brand: $_suhuStream");
  }
}


Ac ringkasanSuhu(List<double> suhuList) {
  double rataRata = suhuList.reduce((a, b) => a + b) / suhuList.length;
  double maksimum = suhuList.reduce((a, b) => a > b ? a : b);
  double minimum = suhuList.reduce((a, b) => a < b ? a : b);
  
  print("Rata-rata suhu: $rataRata°C");
  print("Suhu maksimum: $maksimum°C");
  print("Suhu minimum: $minimum°C");
  
  return Ac(">> Ringkasan", rataRata, StatusAc.nonAktif, suhuList, StreamController<double>());
}

void main() async {
  Ac acRumah = Ac("Daikin", 24.0, StatusAc.nonAktif, [], StreamController<double>());
  
  acRumah.hidupkan();
  double suhuBaru = await acRumah.aturSuhu(29.0);
  acRumah.riwayatSuhu.add(suhuBaru);
  acRumah.suhuStream.add(suhuBaru);
  acRumah.notifikasiSuhu();
  
  suhuBaru = await acRumah.aturSuhu(20.0);
  acRumah.riwayatSuhu.add(suhuBaru);
  acRumah.suhuStream.add(suhuBaru);
  
  acRumah.tampilkanRiwayatSuhu();
  acRumah.suhuTerakhir();
  
  acRumah.matikan();
  
  ringkasanSuhu(acRumah.riwayatSuhu.cast<double>());
  print(ringkasanSuhu(acRumah.riwayatSuhu.cast<double>()).suhu);
}