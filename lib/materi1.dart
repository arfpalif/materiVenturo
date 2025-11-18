Future<List<int>> fetchUmur() async {
  await Future.delayed(Duration(seconds: 2));
  return [20, 21, 22];
}

void main() async{
  try {
    print("memulai pengambilan data umur...");
    var daftar = await fetchUmur();
    daftar.forEach((umur) {
      print('Umur: $umur');
    });
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}