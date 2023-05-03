Future<void> hello() {
  return Future.delayed(Duration(seconds: 2), () {
    print('Ini isi Future nya');
  });
}

void main() {
  hello();
  print('Testing Future 2 detik aja:');
}
