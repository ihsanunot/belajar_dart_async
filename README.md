# Belajar Dart Async

**Future** sama seperti async di javascript, future adalah hasil dari async computation.

Future adalah sebuah *class* yang menginisiasi sebuah proses yang akan dijalankan secara *asynchronous*. 

Future akan mengembalikan sebuah nilai ketika prosesnya selesai.

Return value yang value nya ada yang nanti async computation nya selesai.

Referensi :
https://api.dart.dev/be/175791/dart-async/Future-class.html

---
**Future Constructor**

Future(computation)
Future.delayed(duration,computation)
Future.error(error)
Future.value(value)

Computation bisa sukses bisa gagal, jadi ada dua states 
- Uncompleted
- Completed

---

**Future Method**

Ada banyak sekali method yang ada di future, salah satu nya:

- whenComplete (future di panggil ketika sukses/error)
Future<T> whenComplete(FutureOr<void> action());

- then (dikembalikan ketika sukses dan diubah data tipe)
Future<R> then<R>(FutureOr<R> onValue(T value), {Function? onError});

- catchError
Future<T> catchError(Function onError, {bool test(Object error)?});

- onError
Future<R> then<R>(FutureOr<R> Function(T value) onValue, {Function? onError});

Method then:
akan dipanggil ketika hasil nya sukses dan jika ingin mengambil data dari future nya pakai then.

onError nanti otomatis berubah jadi data lain nya

jika hanya ingin cek error tanpa merubah data
pakai catchError

catchError berarti anda ingin melakukan sesuatu ketika terjadi error.

---

**Try Catch Finally**

Meski ini biasa di pakai di sync tapi bisa kita manipulasi secara tidak langsung di Future.

**CATATAN:**

Ingat value yang tipe nya void gak bisa return tapi bisa di manipulasi buat nge return nilai atau data.

- Contoh 

> return Future.value(String nama)

taruh aja di dalam future dan bisa nge-return deh.

---

## Stream

Anggap saja ini Future Collection, tapi beda dengan collection biasa yang harus semua data nya lengkap lalu di panggil.

Kalah pakai Stream kita bisa langsung ambil data yg ada meski belum lengkap 

Stream = Future yang Value nya lebih dari satu, referensi nya bisa ke class stream dan ada juga Stream constructor

- Stream Class:
https://api.dart.dev/stable/2.19.6/dart-async/Stream-class.html


- Stream Constructor:
https://api.dart.dev/stable/2.19.6/dart-async/Stream-class.html#constructors

- Contoh :
empty()
value(T)
fromFuture(Future<T>)
fromFutures
fromIterable(Iterable<T>)
periodic

---

**Stream Subscription**

Karean bentuk data nya seperti aliran data, kita perlu melakukan subscribe jika ingin tahu data yang terdapat di Stream.

Stream hanya bisa di subscribe sebanyak satu kali

Untuk melakukan subscribe terhadap stream, kita bisa menggunakan method listen(callback)
yang otomatis mengembalikan object StreamSubscription<T>.

Jadi kalau pakai periodic dia akan terus terusan
ngirim data sampai di stop manual

jadi beda nya klo Future hanya sekali panggil
kalau streamsubs ini bisa perkali kali running nya

Dan Stream Subscription hanya bisa di deklarasi kan sekali atau dia akan error pas di running.

**Stream Subscription Method**
onData(callback)  // ketika menerima data
onError(callback) // ketika error
onDone(callback)  // ketika stream selesai
cancel()
pause()
resume()

Jika pakai Stream.listen(callback), parameter callback nya otomatos menjadi onData callback di subscription nya.

Jika mengubah onData(callback) lagi maka otomatis callback di listen() akan di ganti.

https://api.dart.dev/stable/2.19.6/dart-async/StreamSubscription-class.html

---

- Transform Stream 

Cocok untuk transform data sebelum diterima oleh Stream Subscription

Ada banyak jenis method di stream, contoh :

- Filter : 
    take(int): Stream<T>
    where(test): Stream<T>
    drain: Future<T>
    disctinct(): Stream<T>
    dll.
- Transformation :
    cast<R> : Stream<R> <= utk konversi value Stream (mirip inheritance)
    map(R convert(T)):Stream<R> <= konversi value stream dengan function convert (mirip .then())
    expand,interable,asyncmap,dll.

---

**Fold & Reduce**
jika ingin membuat perhitungan data dari setiap stream kita bisa gunakan method fold dan reduce

- fold(initial,combine): Future<R>
- reduce(combine): Future<R>

referensi :
https://stackoverflow.com/questions/20491777/dart-fold-vs-reduce

---

**Broadcast Stream**
Stream biasa hanya bisa di subscribe oleh satu Stream subscribe.

Tetapi Broadcast Stream mampu utk subscribe lebih dari satu stream subscription.

Biasanya menggunakan method asBroadcastStream()

---

**Timer**

Timer adalah class di dart yang bisa digunakan untuk membuat pekerjaan yang terjadwal secara periodik.

Jenis Timer:

- Delayed Timer
- Periodic Timer

Referensi:
https://api.dart.dev/stable/2.19.6/dart-async/Timer-class.html

Contoh ada delayed timer utk delayed task yg bisa kita minta jalankan task setelah waktu terteuntu

kita juga bisa gunakan consturctor


> Timer(duration,callback)


- durasi
- callback = akan di jalankan ketika durasi tercapai


Periodic Timer bisa kita gunakan untuk menjalankan sebuah pekerjaan secara periodik.

Contoh misalkan tiap 2 detik sekali kita jalan kan print atau a dll.

> Timer.periodic(duration,callback)

---

## Async 

Mirip yang ada di Javascript ES6

**Await**

Mirip yang ada di Javascript ES6, dan hanya bisa digunakan di dalam async.

Dengan menggunakan fungsi await, kode terlihat seperti Synchronous tapi ini sebenernya Asynchronous.

cara pakai kata kunci await tambahkan di Future yang ingin kita ambil Data nya.

Jadi lebih simple karena pakai await bikin lebih clean tanpa nesting .then() berkelanjutan.

Kita juga Bisa Menggunakan **Try Cacth Finally** layak nya di kode Synchronous.

--

**Async Await Stream**

Selain bisa dipakai di Future, bisa dipakai juga di dalam Stream.

Dengan begitu kita bisa menggunakan Stream seperti perulangan biasa

Tapi WAJIB diperhatikan saat menggunakan async await stream, pastikan Stream akan selesai.

Kalau tidak error **perulangan nya gak bakal berhenti**

jadi pastikan klo mau pakai Async Await Stream, stream nya itu akan berhenti.

### Isolate

Setiap kode dart **dijalankan** dijalan dalam **isolate** dengan single thread 

Karena hanya satu thread, ketika ada kode yang melakukan blocking, maka otomatis kode tersebut melakukan blocking seluruh event loop

Hal diatas akan sangat **BERBAHAYA**, karena bisa membuat semua proses stuck dan tidak berjalan.

Jadi kita bikin function block() di isolate yang berbeda sehingga tidak menggangu Isolate utama yang sedang digunakan menjalankan Aplikasi.

Untuk membuat Isolate kita bisa gunakan static method :

> **Isolate.spawn(function(T),T)**

dimana function akan di eksekusi di Isolate berbeda dengan mengirim parameter T

> Isolate.exit();

Jadi proses apapun yang sedang dijalan kan Isolate.exit() saat itu akan di matikan.



Bagus nya jika Isolate nya udah tidak digunakan lagi, isolate nya di matikan.

karena tidak ada sharing data antar isolate, maka nya biasa nya function yang kita kirim ada <void>, kenapa void? karena memang tidak bisa return data antar isolate yang berbeda.



Isolate.spawn ini dipakai untuk membuat Isolate baru utk memanggil function yg ingin di panggil.

Biasa nya kalau spawn tidak terpanggil karena letak isolate yg ingin di panggil bukan di isolate utama nya.

Maka dari itu kita harus bikin *Komunikasi Antar Isolate* utk ambil data nya.



Referensi :
https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html

---


**Komunikasi Antar Isolate**

Jika kita ingin mendapatkan nilai hasil dari perhitungan Isolate lain/meng-eksekusi function di Isolate lain, namun hasil dari function nya ingin kita simpan dapatkan di Isolate utama.

- Pada kasus di atas kita bisa menggunakan

> **Receive dan Send Port**

Mirip channel jika di golang, kita bisa mengirim dan menerima data dari Isolate lain.

Kita cukup buat ReceivePort, lalu kirim SendPort yang terdapat di ReceivePort nya ke Isolate lain.

Di Isolate lain kita bisa mengirim data menggunakan SendPort tersebut.

ReceivePort ini mirip Stream, karena kita bisa listen data dari ReceivePort

Referensi :

https://api.dart.dev/stable/2.19.6/dart-isolate/ReceivePort-class.html

https://api.dart.dev/stable/2.19.6/dart-isolate/SendPort-class.html


---

**Completer**

Completer adalah Class yang digunakan untuk mempermudah membuat *Future*.

Contoh saat kita integrasi dengan library orang lain yang menggunakan Callback, lalu kita wrapping menjadi Future, kita bisa mengunakan Completer ini.


--- 

**Stream Controller**

Selain pakai Completer yang bisa digunakan untuk membuat Future

Dart juga ada Class Stream Controller untuk membuat *Stream*.

Kasus nya juga cocok ketika membuat Stream ketika kita menggunakan Library orang lain yang memakai Callback.

Referensi:
https://api.dart.dev/stable/2.19.6/dart-async/StreamController-class.html

---

## Generator

Dart memiliki fitur bernama Generator yang digunakan untuk membuat Data Collection ataupun Async.

Data Sync akan mengembalikan Iterable<T>
sedangkan data Async akan mengembalikan Stream<T>

**Generator:**

- Untuk membuat generator Sync, tinggal tambah sync* di function

- Untuk membuat generator Async, tinggal tambah
async* di function

- Untuk Mengembalikan value nya, kita gunakan yield value

++ perhatikan ada data bintang (*).

++ Kata kunci yield* digunakan untuk generator 'mengembalikan' rekursif (atau iterable/stream apa pun dengan tipe yang sama)

### yield*

yield* bisa digunakan untuk mengirim value di Generator yang mengirim seluruh data Iterable<T> atau Stream<T>

Karena biasa nya kalau pakai yield biasa, itu hanya akan mengirim satu data saja.

Jika ingin mengirim lebih dari satu data pakai yield*

Referensi :
https://jelenaaa.medium.com/what-are-sync-async-yield-and-yield-in-dart-defe57d06381

---

### Async Package

- Semua class Dart Async terdapat di package dart:async

- Namun diluar itu, tim Dart membuat package khusus yang berisi class-class bantuan untuk Dart Async, yaitu package async

Referensi:
https://pub.dev/packages/async

---

**Async Cache**

**AsyncClass** merupakan class di Async Package yang digunakan untuk menjalankan async function, namun hasil nya disimpan di memory selama durasi waktu tertentu

Jika durasi waktu sudah lewat, maka async function akan di eksekusi lagi.

Cocok buat ngambil data Future yang banyak dan lama, jadi di cache aja biar gak begitu lama.

Referensi:
https://pub.dev/documentation/async/latest/async/AsyncCache-class.html

---

**Async Memoizer**

Mirip dengan Async Cache, yang membedakan adalah Async Memoize akan menyimpan data secara permanen, tanpa ada durasi waktu.

Dan Function nya juga beda, dia pakai runOnce()

Referensi:
https://pub.dev/documentation/async/latest/async/AsyncMemoizer-class.html

---

**Future Test**

Package test di Dart digunakan utk melakukan pengetesan kode Async di dalam Future

Jadi mempermudah ketika kita membuat unit test kode Asynchronous

Di dalam test(), kita bisa masukkan function async, sehingga bisa menggunakan await.

---

**Stream Test**

Function Matcher ada banyak sekali yang cocok untuk pengetesan terhadap jenis data Stream.

*Stream Matcher nya :*

- emits() match utk single event
- emitsError() match utk single error
- emitsDone utk yang single done
- emitsAnyOf() consume event match satu utk kemungkinan beberapa data 
- emitsInOrder() consume event match multiple matcher dgn urutan yang sudah di tentukan
- emitsInAnyorder() sama seperti emitsInOrder() tapi yang penting dia tidak PEDULI urutan nya (Ngacak)
- neverEmits() memastikan stream selesai tanpa match data sama sekali

---

Sisa nya bisa belajar Class-Class yang ada di Dart juga di Pub.dev nya,

Lalu, masuk ke tahap selanjut yaitu "Belajar Flutter".

Terima Kasih, Happy Coding ^^

**Credits to** [Programmer Zaman Now](https://www.programmerzamannow.com/)