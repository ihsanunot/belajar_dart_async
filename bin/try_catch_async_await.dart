Future<String> namaDepan() async {
  return 'Ayana';
}

Future<String> namaBelakang() async {
  return 'Ihsan';
}

Future<String> cobaKatakan(String nama) async {
  return 'Hello $nama';
  // throw Exception('Error ini');
}

Future<void> katakan() async {
  try {
    String depan = await namaDepan();
    String belakang = await namaBelakang();
    String hallo = await cobaKatakan('$depan $belakang');
    print(hallo);
  } catch (e) {
    print(e);
  } finally {
    print('Try Cacth:');
  }
}

void main() {
  katakan();
  print('Contoh Await:');
}
