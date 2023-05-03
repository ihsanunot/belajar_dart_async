Stream<int> angkas() {
  return Stream.periodic(Duration(seconds: 1), (i) => i);
}

void main() {
  Stream<int> angkaStream = angkas();
  Stream<int> contohBroadcast = angkaStream.asBroadcastStream().take(5);

  contohBroadcast.listen((event) {
    print(event);
  });

  contohBroadcast.listen((event) {
    print(event);
  });

  print('Contoh Broadcast Stream:');
}

// listen contohBroadcast 2 kali dia bakal terus
// klo mau di batasin pakai .take(angka) jadi cuma ngambil beberapa data saja