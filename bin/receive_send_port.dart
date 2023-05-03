import 'dart:io';
import 'dart:isolate';

class Parameter {
  String prefix;
  SendPort kirimPort;

  //constructor
  Parameter(this.prefix, this.kirimPort);
}

Future<void> angkas(Parameter paramsnya) async {
  for (var i = 0; i < 10; i++) {
    sleep(Duration(seconds: 1));
    paramsnya.kirimPort.send('${paramsnya.prefix} - $i');
  }
  Isolate.exit();
}

void main() {
  final terimaPort = ReceivePort();
  Isolate.spawn(
      angkas,
      Parameter(
          'Ayana',
          terimaPort
              .sendPort)); //sendPort jadi getter nya karena error pakai kirimPort

  terimaPort.listen((event) {
    print(event); // yg ini narik semua for i < 10
  });

  print('Receive Port Testing:');
}


// Jika kita ingin pakai lebih dari satu Parameter di SendPort nya yang bisa dilakukan adalah bungkus semua Parameter nya dalam 1 Class
// Lalu ganti parameter si function nya dengan nama Class yang dibuat