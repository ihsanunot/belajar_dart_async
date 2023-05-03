Future<String> nama() {
  return Future.value('Ayana Shahab Al- Ihsan');
}

void main() {
  nama()
      .then((value) => value.split('  ')) //future nya berubah jadi list
      .then((value) => value.reversed) // list nya di balikan
      .then((value) =>
          value.map((e) => e.toUpperCase())) // list nya upperCase tiap data nya
      .then((value) => print(value)); // print setiap data yg ada di list
  print('Done');
}
