Future<String> sayHi(String nama) {
  return Future.value('Hai $nama');
}

void main() {
  sayHi('Ayana')
      .then((value) => print(value))
      .catchError((error) => print('Error dengan pesan $error'))
      .whenComplete(() => print('Kelar Semua'));
}

// jadi tinggal pakai then cacth error sama whencomplete itu sama aja dengan pakai try catch finnaly