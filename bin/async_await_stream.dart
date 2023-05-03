Stream<String> namas() {
  return Stream.fromIterable(['Ayana', 'Shahab', 'Mona']);
}

Future<String> namaLengkap() async {
  String nama = '';
  await for (String n in namas()) {
    nama += '$n '; //kasih spasi
  }
  return nama.trim();
}

void main() {
  namaLengkap().then((value) => print(value));
  print('Testing Await Stream:');
}

// hati hati klo dicampur stream periodic