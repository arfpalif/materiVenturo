import 'dart:async';

enum StatusAc { nyala, mati }

(double suhu, DateTime waktu)RingkasanSuhu(List<double> suhuList) {
  double rataRata = suhuList.reduce((a, b) => a + b) / suhuList.length;
  double maksimum = suhuList.reduce((a, b) => a > b ? a : b);
  double minimum = suhuList.reduce((a, b) => a < b ? a : b);
  return (rataRata, DateTime.now());
}

class Ac{
  String ?brand;
  double ?_suhu;
  Enum ?status;
  // Stream ?_suhuStream;
  final controller = StreamController<double>.broadcast();
  List ?_riwayatSuhu;

  Ac(this.brand, this._suhu, this.status, this._riwayatSuhu);

  hidupkan() {
    status = StatusAc.nyala;
    print("AC $brand dinyalakan");
  }
  matikan() {
    status = StatusAc.mati;
    print("AC $brand dimatikan");
  }
  aturSuhu(double suhuBaru) async {
    await Future.delayed(Duration(seconds: 1));
    _suhu = suhuBaru;
    if(suhuBaru >= 28 ){
      print("Peringatan: Suhu $suhuBaru terlalu tinggi!");
      await Future.delayed(Duration(seconds: 1));
      _suhu = 24.0;
      notifikasiSuhu();
    }
    else{
      print("Suhu AC $brand diatur ke $_suhu°C");
      _riwayatSuhu?.add(_suhu);
      notifikasiSuhu();
    }
    return _suhu;
  }
  notifikasiSuhu() {
    controller.stream.listen((suhu) {
      print(">> Notifikasi: Suhu AC $brand berubah menjadi $suhu°C");
    });
  }
  tampilkanRiwayat(){
    print("Riwayat suhu AC $brand: $_riwayatSuhu");
  }
  suhuTerakhir(){
    print("Suhu terakhir AC $brand: $_suhu");
  }
}

void main() async {
  RingkasanSuhu(){}
  Ac acRuangTamu = Ac("Samsung", 24.0, StatusAc.mati, []);
  acRuangTamu.hidupkan();
  double suhuBaru = await acRuangTamu.aturSuhu(30.0);
  acRuangTamu.controller.add(suhuBaru);
  suhuBaru = await acRuangTamu.aturSuhu(26.0);
  acRuangTamu.controller.add(suhuBaru);
  acRuangTamu.tampilkanRiwayat();
  acRuangTamu.suhuTerakhir();
  acRuangTamu.matikan();
}



