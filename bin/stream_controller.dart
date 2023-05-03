import 'dart:async';

// ini data library orang
void longRunningStream(void Function(String) onNext,
    void Function(Error?) onError, void Function() onDone) {
  // contoh function callback

  var listen = Stream.periodic(Duration(seconds: 1)).take(10).listen((event) {
    onNext("Mona");
  });

  listen.onError((error) => onError(error));
  listen.onDone(() => onDone());
}

// ini Stream Controller biar gak kena Callback Hell
Stream<String> jalaninStreamController() {
  StreamController<String> streamController = StreamController();

  longRunningStream((data) {
    streamController.add(data);
  }, (error) {
    streamController.addError(error!);
  }, () {
    streamController.close();
  });

  return streamController.stream;
}

void main() {
  jalaninStreamController().listen((event) {
    print(event);
  });
  print("Contoh Stream Controller:");
}
