import 'dart:io';
import 'dart:isolate';

Future<void> angkas(SendPort kirimPort) async {
  for (var i = 0; i < 10; i++) {
    sleep(Duration(seconds: 1)); // pasang jeda tiap satu detik
    kirimPort.send(i); // tiap 1 detik dia akan ngirim data nya
  }
  Isolate.exit(); // jika sudah sampai batas harus di exit
}

void main() {
  final terimaPort = ReceivePort();
  Isolate.spawn(
      angkas, terimaPort.sendPort); // kita kirim sendPort properties nya

  terimaPort.listen((event) {
    print(event); // yg ini narik semua for i < 10
  });

  // terimaPort.take(5).listen((event) {
  //   print(event);
  // });

  print('Receive Port Testing:');
}

// setiap Isolate baru ngirim data ke dalam sendPort nya
// maka bisa kita terima di terimaPort nya
// ReceivePort() adlh class turunan stream jadi tinggal pakai listen buat ambil data nya
// Jika kita ingin pakai lebih dari satu Parameter di SendPort nya yang bisa dilakukan adalah bungkus semua Parameter nya dalam 1 Class