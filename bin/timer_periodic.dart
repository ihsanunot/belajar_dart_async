import 'dart:async';

void main() {
  Timer.periodic(Duration(seconds: 1), (timer) {
    print("Timer ke ${timer.tick}");
    if (timer.tick >= 5) {
      timer.cancel(); // pakai tick dan juga cancel
    }
  });

  print("Contoh Periodic:");
}

// parameter nya timer
// .tick itu properties
// ada banyak sekali jenis class property di Timer