# Panduan Penggunaan Package, Lottie, Google Fonts, dan Navigation di Flutter

Dokumentasi ini menjelaskan cara menggunakan package di Flutter, termasuk **Lottie**, **Google Fonts**, dan cara melakukan **Navigation** menggunakan route `"/"`.

## **Menggunakan Package di Flutter**

Package di Flutter adalah kumpulan kode yang memberikan fungsionalitas tambahan pada aplikasi tanpa perlu menulis kode dari awal. Untuk menggunakan package, Anda perlu menambahkannya ke dalam file `pubspec.yaml` dan menjalankan perintah `flutter pub get`.

### Langkah-langkah:

1. Buka file `pubspec.yaml`.
2. Tambahkan dependensi package yang ingin digunakan di dalam bagian `dependencies`:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     lottie: ^2.0.0
     google_fonts: ^3.0.0
   ```
3. Jalankan perintah berikut di terminal untuk mengunduh dan menginstal package:
   ```bash
   flutter pub get
   ```

## **Menggunakan Lottie di Flutter**

Lottie memungkinkan kita untuk menampilkan animasi JSON di aplikasi Flutter.

### Langkah-langkah:

1. Tambahkan dependensi `lottie` di dalam `pubspec.yaml`:
   ```yaml
   dependencies:
     lottie: ^2.0.0
   ```
2. Jalankan `flutter pub get` untuk mengunduh package.
3. Impor package dan gunakan widget `Lottie.asset` untuk menampilkan animasi JSON:

   ```dart
   import 'package:lottie/lottie.dart';

   class MyWidget extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: Center(
           child: Lottie.asset('assets/animation.json'), // File JSON animasi
         ),
       );
     }
   }
   ```

4. Pastikan file animasi JSON ada di dalam folder `assets` dan tambahkan ke dalam `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/animation.json
   ```

## **Menggunakan Google Fonts di Flutter**

Dengan menggunakan package **Google Fonts**, kita bisa mengakses berbagai font dari Google Fonts untuk digunakan di aplikasi Flutter.

### Langkah-langkah:

1. Tambahkan dependensi `google_fonts` di dalam `pubspec.yaml`:
   ```yaml
   dependencies:
     google_fonts: ^6.2.1
   ```
2. Jalankan `flutter pub get`.
3. Impor dan gunakan package `google_fonts` untuk mengubah font teks di aplikasi:

   ```dart
   import 'package:google_fonts/google_fonts.dart';

   class MyWidget extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: Center(
           child: Text(
             'Hello, Flutter!',
             style: GoogleFonts.lato(fontSize: 24), // Menggunakan font Lato
           ),
         ),
       );
     }
   }
   ```

## **Navigasi (Routes) di Flutter**

Navigasi memungkinkan kita untuk berpindah antar layar (halaman) di dalam aplikasi Flutter. Anda dapat menggunakan **routes** untuk mengelola halaman-halaman aplikasi.

### Langkah-langkah:

1. Definisikan route di dalam properti `routes` pada widget `MaterialApp`:

   ```dart
   import 'package:flutter/material.dart';

   void main() {
     runApp(MyApp());
   }

   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         title: 'Flutter Demo',
         initialRoute: '/',  // Mendefinisikan route awal
         routes: {
           '/': (context) => HomePage(),  // Route untuk halaman utama
           '/second': (context) => SecondPage(),  // Route untuk halaman kedua
         },
       );
     }
   }

   class HomePage extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Home Page')),
         body: Center(
           child: ElevatedButton(
             onPressed: () {
               Navigator.pushNamed(context, '/second');  // Navigasi ke halaman kedua
             },
             child: Text('Go to Second Page'),
           ),
         ),
       );
     }
   }

   class SecondPage extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Second Page')),
         body: Center(
           child: ElevatedButton(
             onPressed: () {
               Navigator.pop(context);  // Kembali ke halaman sebelumnya
             },
             child: Text('Back to Home Page'),
           ),
         ),
       );
     }
   }
   ```

### Penjelasan:

- Pada contoh di atas, kita mendefinisikan dua route:
  - `'/'` untuk halaman utama (HomePage)
  - `'/second'` untuk halaman kedua (SecondPage)
- Untuk berpindah antar halaman, gunakan `Navigator.pushNamed(context, '/second')` untuk menuju ke halaman kedua, dan `Navigator.pop(context)` untuk kembali ke halaman sebelumnya.

---

# Konsep Pengembangan Flutter dan Manajemen State

## 1. Callback Function

**Definisi:**  
Fungsi yang dipanggil kembali setelah suatu proses selesai dilakukan atau ketika suatu peristiwa terjadi.

**Contoh:**

```dart
void fetchData(Function onComplete) {
  // Simulasi pengambilan data
  print("Mengambil data...");
  onComplete(); // Memanggil fungsi setelah data selesai diambil
}

void main() {
  fetchData(() {
    print("Data berhasil diambil!");
  });
}
```

---

## 2. State

**Definisi:**  
State adalah data atau kondisi yang dapat berubah dalam suatu aplikasi. State ini menentukan bagaimana tampilan aplikasi dan elemen-elemen interaktif berfungsi.

---

## 3. Stateless Widget

**Definisi:**  
Widget yang **tidak memiliki state yang berubah** selama masa hidupnya. Contoh: widget yang hanya menampilkan teks atau gambar statis.

**Contoh:**

```dart
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Ini adalah Stateless Widget");
  }
}
```

---

## 4. Stateful Widget

**Definisi:**  
Widget yang memiliki state yang dapat **berubah** ketika aplikasi dijalankan, misalnya pada kasus counter atau tombol yang memengaruhi data.

**Contoh:**

```dart
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Counter: $counter"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text("Tambah"),
        ),
      ],
    );
  }
}
```

---

## 5. setState Method

**Definisi:**  
Metode `setState` digunakan untuk memberitahukan Flutter bahwa ada perubahan pada state sehingga UI perlu diperbarui.

**Kelemahan:**

- Tidak efisien untuk aplikasi besar.
- Membingungkan jika terlalu sering digunakan di widget tree yang kompleks.

**Solusi:**  
Gunakan **state management** seperti _Provider_, _Bloc_, atau _GetX_.

---

## 6. Widget Tree

**Definisi:**  
Hierarki widget dalam aplikasi Flutter. Widget tree adalah struktur pohon yang menggambarkan bagaimana widget saling berhubungan.

**Contoh:**

```plaintext
MaterialApp
  Scaffold
    AppBar
    Body
      Column
        Text
        ElevatedButton
```

---

## 7. InheritedWidget

**Definisi:**  
Widget khusus yang digunakan untuk mengirimkan data (state) ke widget lain di bawahnya dalam widget tree tanpa memerlukan _callback_.

**Kelebihan:**  
Mempermudah berbagi data ke banyak widget sekaligus.

**Contoh:**

```dart
class MyInheritedWidget extends InheritedWidget {
  final String data;

  MyInheritedWidget({
    required this.data,
    required Widget child,
  }) : super(child: child);

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}
```

---

## 8. Solusi Manajemen State

Flutter memiliki beberapa metode state management yang populer:

### **GetX**

- Ringan dan mudah digunakan.
- Menggabungkan state management, dependency injection, dan routing.

### **Provider**

- Disarankan oleh tim Flutter.
- Mudah digunakan untuk aplikasi kecil hingga menengah.

### **Bloc (Business Logic Component)**

- Cocok untuk aplikasi besar.
- Menggunakan pola arsitektur berbasis stream.

---
