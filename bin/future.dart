Future<void> halo() {
  return Future.delayed(Duration(seconds: 2), () {
    print("Future Dasar");
  });
}

void main() {
  halo();
  print("Future:");
}
