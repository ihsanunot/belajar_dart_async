Stream<int> angkaDouble(int angka) async* {
  yield angka;
  yield angka;
}

Stream<int> asyncAngka() async* {
  for (int i = 0; i < 10; i++) {
    // yield angkaDouble(i);
    yield* angkaDouble(i);
  }
}

void main() {
  asyncAngka().listen((event) {
    print(event);
  });
  print('Contoh nya:');
}
