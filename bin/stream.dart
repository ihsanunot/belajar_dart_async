import 'dart:async';

Stream<String> contohStream() {
  return Stream.periodic(Duration(seconds: 2), (i) {
    if (i % 2 == 0) {
      return '$i ini genap';
    } else {
      return '$i ini ganjil';
    }
  });
}

// i nya itu proses computation nya

void main() {
  Stream<String> flow = contohStream();
  StreamSubscription<String> listen = flow.listen((event) {
    print(event); // nanti terganti otomatis oleh si onData
  });

  listen.onData((data) {
    print('Streaming Subscription : $data');
  });

  listen.onDone(() {
    print('Subs Done');
  });

  print('Testing StreamSubs:');
}

// karena pakai periodic jadi perngulangan akan terus berjalan
// cara matiin nya tutup aja aplikasi nya.
