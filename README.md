# Ringkasan Flutter

## Apa itu Flutter?

Flutter adalah sebuah **tool** yang digunakan untuk mengembangkan aplikasi mobile. Dengan menggunakan Flutter, Anda dapat membuat aplikasi untuk berbagai sistem operasi (seperti Android dan iOS) hanya dengan **satu codebase** saja.

- Dibangun menggunakan bahasa pemrograman **Dart**.
- Merupakan **SDK (Software Development Kit)** yang mengkompilasi kode Dart menjadi kode native untuk perangkat.

## Widget di Flutter

**Widget** adalah komponen yang saling terhubung untuk membentuk antarmuka pengguna (UI) di Flutter. Setiap elemen visual, seperti tombol, teks, layout, dan animasi, adalah widget.

### Konsep Widget

- **Widget Tree**: Setiap widget memiliki hubungan **parent-child**, membentuk sebuah pohon hierarkis yang disebut **widget tree**.

### Analogi Widget

Pikirkan tentang widget seperti **pohon** dengan **cabang-cabang**. Setiap cabang adalah widget yang bisa memiliki cabang (widget) lainnya.

## Struktur Proyek Flutter

Struktur proyek Flutter umumnya terdiri dari folder untuk kode aplikasi, asset, dan konfigurasi lainnya. Di dalamnya terdapat berbagai file untuk pengaturan dan pengembangan aplikasi menggunakan Flutter.

## Widget Essensial

Berikut beberapa widget penting dalam aplikasi Flutter:

### Root Widget

- **MyApp**: Widget root dari aplikasi Flutter, tempat aplikasi dimulai.

### MaterialApp dan Scaffold

- **MaterialApp**: Widget dasar untuk aplikasi dengan desain material.
- **Scaffold**: Kerangka dasar untuk tata letak halaman aplikasi.

### Widget Layouting

- **Row**: Menyusun widget secara horizontal.
- **Column**: Menyusun widget secara vertikal.

### Widget Umum

- **Container**: Widget serbaguna yang digunakan untuk membungkus dan menata elemen.
- **Icon**: Menampilkan ikon.
- **Text**: Menampilkan teks.

### Widget Lainnya

- **SafeArea**: Mengatur tampilan agar tidak tertutup oleh notch atau area layar tertentu.
- **Image**: Menampilkan gambar.
- **Button**: Membuat tombol yang dapat ditekan.

## Widget Layouting

Widget layouting digunakan untuk menyusun elemen-elemen UI pada layar. Beberapa widget layouting yang umum digunakan adalah:

- **Alignment Property**: Mengatur posisi widget di dalam parent widget.
- **Main dan Cross Axis**: Mengatur aliran dan penataan widget dalam **Column** dan **Row**.

---
