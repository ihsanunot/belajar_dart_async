Future<String> sayHello(String nama) {
  return Future.delayed(Duration(seconds: 2), () {
    // return 'Hello! $nama';
    // throw Error(); //contoh buat error
    return Future.error(Exception('Salah'));
  });
}

void main() {
  sayHello('Ayana Future')
      // .onError((error, stackTrace) => 'Contoh onError/ Fallback')
      .whenComplete(() => print('Hore Complete!'))
      .then((value) => print(value))
      .catchError((error) => print('ini pesan error $error'));
  print('Testing Then:');
}  // Cek Comment nya buat Testing nya.