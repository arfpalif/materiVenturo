class Statistik {
  final int max;
  final int min;
  final double average;
  final double doubleAverage;

  Statistik({required this.max, required this.min, required this.average, required this.doubleAverage});
}

Statistik hitungStatistik(List<int> data) {
  int max = data.reduce((a, b) => a > b ? a : b);
  int min = data.reduce((a, b) => a < b ? a : b);
  double doubleAverage = data.reduce((a, b) => a + b) * 2 / data.length;
  double average = data.reduce((a, b) => a + b) / data.length;

  return Statistik(max: max, min: min, average: average, doubleAverage: doubleAverage);
}

void main() {
  var statistik = hitungStatistik([70, 80, 90, 85]);
  print('Max: ${statistik.max}');  // Output: 90
  print('Min: ${statistik.min}');  // Output: 70
  print('Double average: ${statistik.average}');
  print("Average ${statistik.doubleAverage}") ; // Output: 81.25
}
