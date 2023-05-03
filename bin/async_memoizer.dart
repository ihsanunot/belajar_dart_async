import 'package:async/async.dart';

Future<String> ambilData() {
  return Future<String>.delayed(Duration(seconds: 2), () {
    return 'Memoizer Data..';
  });
}

void main() async {
  final asyncMemoizernya = AsyncMemoizer<String>();

  final hasil1 = await asyncMemoizernya.runOnce(() => ambilData());
  print(hasil1);

  final hasil2 = await asyncMemoizernya.runOnce(() => ambilData());
  print(hasil2);
}

// run terminal async_memoizer.dart