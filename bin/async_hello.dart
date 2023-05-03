Future<String> sayHallo(String nama) async {
  return 'Hallo! $nama';
}

void main() {
  sayHallo('Nananana').then((String nilai) => print(nilai));
  print('Test Async 1:');
}
