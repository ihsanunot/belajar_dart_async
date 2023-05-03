Stream<int> angkas() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}

void main() {
  // ini nanti akan terus bertambah sesuai list yang ada di angkas()
  Future<int> total = angkas().fold(0, ((sebelum, elemen) => sebelum + elemen));

  total.then((hasil) => print('total nya $hasil'));
  print('Str Fold Testing:');
}
