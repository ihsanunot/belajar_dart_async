Iterable<int> syncAngka() sync* {
  for (int i = 0; i < 10; i++) {
    yield i; //return value pakai yield value
  }
}

void main() {
  print('Contoh:');

  syncAngka().forEach((element) {
    print(element);
  });
}
