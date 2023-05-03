import 'dart:io';
import 'dart:isolate';

Future<void> kataHello(String nama) async {
  sleep(Duration(seconds: 2));
  print("Hello $nama");
  Isolate.exit(); // buat stop si isolate nya
}

void main() {
  Isolate.spawn(kataHello,
      "Ayana"); // isolate yang ini tidak akan terpanggil karena berada di isolate yang berbeda
  print("Contoh Isolate:");
}
