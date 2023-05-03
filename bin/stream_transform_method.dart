Stream<int> angkas() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}

void main() {
  angkas()
      .where((angka) => angka % 2 == 0)
      .map((event) => event * 10) // konversi data jadi dikali 10 semua
      .listen((event) => print(event));

  print('Str Transform Testing:');
}
