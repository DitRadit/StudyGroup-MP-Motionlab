# Penggunaan API di Flutter dengan Dio

Dokumentasi ini memberikan penjelasan mengenai API, service, controller, serta bagaimana cara mengonsumsi API di Flutter menggunakan library Dio.

## 1. Apa itu API?

**API (Application Programming Interface)** adalah kumpulan aturan dan protokol yang memungkinkan aplikasi untuk berkomunikasi dengan aplikasi lainnya. API memungkinkan perangkat lunak untuk bertukar data dan menjalankan fungsi tertentu tanpa perlu mengetahui implementasi internal aplikasi yang satu dengan lainnya.

Contoh penggunaan API adalah ketika aplikasi mengakses data dari server menggunakan _REST API_.

## 2. Apa itu Service di Flutter?

Dalam konteks Flutter, **service** adalah kelas yang bertanggung jawab untuk melakukan tugas tertentu, seperti mengelola logika aplikasi atau mengakses data dari sumber eksternal (misalnya API atau database lokal). Service membantu memisahkan logika bisnis dan pengelolaan data dari UI (User Interface) sehingga kode menjadi lebih bersih dan lebih mudah dikelola.

## 3. Apa itu Controller di Flutter?

**Controller** di Flutter merujuk pada objek yang mengelola interaksi antara UI dan logika aplikasi. Misalnya, `TextEditingController` digunakan untuk mengontrol dan mengelola teks dalam `TextField`. Dalam arsitektur yang lebih besar (seperti MVC atau MVVM), controller berfungsi untuk mengatur alur data antara model dan view.

## 4. Cara Mengonsumsi API dengan Dio di Flutter

`Dio` adalah library HTTP di Flutter yang sering digunakan untuk melakukan request API karena memiliki banyak fitur, seperti interceptors, konfigurasi global, file downloading/uploading, dll.

# Alur Consume API dengan Dio di Flutter

Berikut adalah alur langkah-langkah untuk mengonsumsi API menggunakan Dio dengan metode GET di Flutter.

## 1. **Menambahkan Dependensi Dio**

- Tambahkan Dio ke dalam `pubspec.yaml`:
  ```yaml
  dependencies:
    dio: ^5.0.0
  ```

## 2. **Import Dio di File Dart**

- Impor Dio di file Dart tempat Anda ingin membuat request:
  ```dart
  import 'package:dio/dio.dart';
  ```

## 3. **Buat Instance Dio**

- Membuat instance Dio yang akan digunakan untuk mengirim request:
  ```dart
  Dio dio = Dio();
  ```

## 4. **Kirim Request GET**

- Kirim request GET ke endpoint API yang diinginkan dan tangani responsenya:
  ```dart
  Response response = await dio.get('URL_API');
  ```

## 5. **Tangani Respons API**

- Proses data yang diterima dari API (misalnya, parsing JSON):
  ```dart
  var data = response.data;
  ```

## 6. **Menampilkan Data di UI**

- Gunakan `FutureBuilder` atau cara lain untuk menampilkan data yang diterima dari API ke dalam UI Flutter.

## 7. **Menangani Error**

- Tangani error yang mungkin terjadi selama request menggunakan `try-catch`:
  ```dart
  try {
    Response response = await dio.get('URL_API');
  } catch (e) {
    print('Error: $e');
  }
  ```

## 8. **Menjalankan Aplikasi**

- Jalankan aplikasi dengan `flutter run` dan pastikan data ditampilkan dengan benar setelah request API berhasil.
