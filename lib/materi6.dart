void main() {
  var nilai = [62, 80, 90, 70, 85];

  var lulus = nilai.where((n) => n >= 75).toList();
  var dikaliDua = nilai.map((n) => n * 2).toList();
  var total = nilai.fold(0, (prev, curr) => prev + curr);

  print('Nilai Lulus: $lulus');
  print('Nilai x2: $dikaliDua');
  print('Total Nilai: $total');
}
