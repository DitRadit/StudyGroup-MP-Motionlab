# **Apa Itu Firebase?**

Firebase adalah platform pengembangan aplikasi yang dibuat oleh Google. Firebase menyediakan berbagai layanan backend, seperti otentikasi, basis data waktu nyata (Firestore dan Realtime Database), cloud storage, hosting, notifikasi push, dan masih banyak lagi. Platform ini dirancang untuk memudahkan pengembangan aplikasi mobile dan web tanpa perlu membangun backend dari awal.

# **Panduan Integrasi Firebase dengan Flutter**

## **Langkah 1: Instalasi Alat Command Line yang Diperlukan**
Jika belum, instal Firebase CLI terlebih dahulu.

Login ke Firebase menggunakan akun Google Anda dengan menjalankan perintah berikut:
```bash
firebase login
```

Instal FlutterFire CLI dengan menjalankan perintah berikut dari direktori mana pun:
```bash
dart pub global activate flutterfire_cli
```

## **Langkah 2: Konfigurasi Aplikasi Flutter untuk Menggunakan Firebase**
Gunakan FlutterFire CLI untuk mengonfigurasi aplikasi Flutter agar terhubung ke Firebase.

Dari direktori proyek Flutter Anda, jalankan perintah berikut untuk memulai konfigurasi aplikasi:
```bash
flutterfire configure
```

## **Langkah 3: Inisialisasi Firebase di Aplikasi Anda**
Dari direktori proyek Flutter Anda, tambahkan plugin inti Firebase dengan perintah berikut:
```bash
flutter pub add firebase_core
```

Pastikan konfigurasi Firebase untuk aplikasi Flutter Anda tetap mutakhir dengan menjalankan perintah berikut:
```bash
flutterfire configure
```

Di file `lib/main.dart`, impor plugin inti Firebase dan file konfigurasi yang telah Anda buat:
```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```

Juga di file `lib/main.dart`, inisialisasi Firebase menggunakan objek `DefaultFirebaseOptions` yang diekspor oleh file konfigurasi:
```dart
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
```

## **Langkah 4: Build dan Jalankan Aplikasi Flutter**
Jalankan perintah berikut untuk membangun dan menjalankan aplikasi Flutter Anda:
```bash
flutter run
```

# **Firebase Firestore dan Stream vs API**

## **Apa Itu Firebase Firestore?**
Firebase Firestore adalah layanan database NoSQL berbasis cloud dari Firebase yang memungkinkan aplikasi menyimpan, menyinkronkan, dan mengelola data dalam skala besar secara real-time dan offline.

### **Fitur Utama Firestore:**
- **Data Realtime:** Sinkronisasi data langsung antar perangkat dan klien.
- **Skalabilitas Tinggi:** Dapat menangani jutaan pengguna tanpa degradasi performa.
- **Query Fleksibel:** Dukungan untuk pencarian kompleks dan filtering data.
- **Offline Mode:** Data tetap tersedia meskipun tidak ada koneksi internet.

---

## **Apa Itu Stream?**
Stream dalam pemrograman adalah aliran data yang dikirim atau diterima secara berkelanjutan dari suatu sumber. Data dikirim dalam potongan kecil, bukan sekaligus.

## **Perbedaan Stream dengan API**

| **Aspek** | **Stream** | **API (Application Programming Interface)** |
|-----------|------------|-----------------------------------------------|
| **Jenis Komunikasi** | Data mengalir terus-menerus | Permintaan dan respons (request-response) |
| **Contoh** | Streaming video, update real-time | Mengambil data JSON dari server |
| **Penggunaan** | Data dinamis yang berubah terus-menerus | Data statis atau tidak terlalu sering berubah |
| **Koneksi** | Stateful (tetap terhubung) | Stateless (koneksi hanya saat request dibuat) |
| **Teknologi Umum** | WebSockets, Firebase Firestore streams | REST API, GraphQL |

---



