import 'package:async/async.dart';

Future<String> ambilData() {
  return Future<String>.delayed(Duration(seconds: 2), () {
    return 'Ambil Data..';
  });
}

void main() async {
  final asyncCachenya = AsyncCache<String>(Duration(seconds: 7));

  final hasil1 = await asyncCachenya.fetch(() => ambilData());
  print(hasil1);
  // ambildata pertama terus disimpan ke AsyncCache<String> selama 10 detik

  final hasil2 = await asyncCachenya.fetch(() => ambilData());
  print(hasil2);
  // karena hasil ambildata masih tersimpan di cache hasil1 maka akan langsung kembalikan data sebelumnya
}

// running dart async_cache.dart di terminal
// yg hasil kedua nunggu duration dari async buat cek nya