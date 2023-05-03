Stream<int> angkas() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}

void main() {
  angkas().where((angka) => angka % 2 == 0).listen((event) => print(event));
  print('Str Filter Testing:');
}
