Future<String> namaDepan() async {
  return 'Ayana';
}

Future<String> namaBelakang() async {
  return 'Ihsan';
}

Future<String> cobaKatakan(String nama) async {
  return 'Hello $nama';
}

Future<void> katakan() async {
  String depan = await namaDepan();
  String belakang = await namaBelakang();
  String hallo = await cobaKatakan('$depan $belakang');
  print(hallo);
}

void main() {
  katakan();
  print('Contoh Await:');
}

// contoh diatas await bertindak seperti .then() bukan menunggu proses