# Local Storage dan Shared Preferences di Flutter

## **Pengertian**

### **1. Local Storage di Flutter**

Local storage mengacu pada berbagai metode untuk menyimpan data langsung di perangkat pengguna tanpa memerlukan koneksi internet.

#### **Jenis Local Storage di Flutter:**

- **SQLite:** Database relasional yang ringan untuk menyimpan data terstruktur dalam bentuk tabel.
- **Hive:** NoSQL database yang cepat dan ringan.
- **File System:** Menyimpan data langsung dalam file yang dapat diakses kembali saat aplikasi dijalankan.

#### **Kapan Digunakan:**

- Untuk menyimpan data yang besar atau kompleks.
- Contoh: daftar kontak, riwayat transaksi, atau konfigurasi aplikasi yang dinamis.

---

### **2. Shared Preferences di Flutter**

Shared Preferences adalah cara sederhana untuk menyimpan data berbasis key-value secara lokal di perangkat. Flutter menyediakan paket `shared_preferences` untuk mempermudah pengelolaan ini.

#### **Fitur Shared Preferences:**

- Cocok untuk menyimpan data kecil dan sederhana (String, int, double, bool, dan List String).
- Data tetap ada meskipun aplikasi ditutup atau perangkat restart.

#### **Kapan Digunakan:**

- Menyimpan preferensi pengguna.
- Contoh: tema aplikasi (dark mode), bahasa pilihan, atau status login.

---

## **Perbedaan Local Storage dan Shared Preferences**

| **Aspek**          | **Local Storage (SQLite, Hive)** | **Shared Preferences**   |
| ------------------ | -------------------------------- | ------------------------ |
| Data yang Disimpan | Data besar dan kompleks          | Data kecil dan sederhana |
| Struktur Data      | Tabel atau Key-Value             | Key-Value                |
| Kinerja            | Cepat untuk data besar           | Cepat untuk data kecil   |
| Use Case           | Riwayat, cache, data aplikasi    | Pengaturan, preferensi   |

---

## **Contoh Implementasi Shared Preferences**

### **1. Menambahkan Dependency**

Tambahkan dependency `shared_preferences` ke file `pubspec.yaml`:

```yaml
dependencies:
  shared_preferences: ^2.0.13
```

### **2. Contoh Kode Simpan dan Ambil Data**

#### **Menyimpan Data ke Shared Preferences**

```dart
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}
```

#### **Mengambil Data dari Shared Preferences**

```dart
Future<String?> getData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
```

### **3. Menggunakan Fungsi di Widget Flutter**

```dart
ElevatedButton(
  onPressed: () async {
    await saveData('username', 'BojongRobot');
    final username = await getData('username');
    print('Username yang tersimpan: $username');
  },
  child: Text('Simpan dan Ambil Data'),
)
```

---

## **Contoh Implementasi Local Storage dengan Hive**

### **1. Menambahkan Dependency**

Tambahkan dependency `hive` dan `hive_flutter`:

```yaml
dependencies:
  hive: ^2.0.5
  hive_flutter: ^1.1.0
```

### **2. Inisialisasi Hive**

```dart
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}
```

### **3. Membuka dan Menggunakan Box**

```dart
Future<void> saveData() async {
  var box = await Hive.openBox('myBox');
  box.put('key', 'BojongRobot');
  print('Data tersimpan: ${box.get('key')}');
}
```

---

## **Kesimpulan**

- **Shared Preferences:** Pilihan terbaik untuk menyimpan data kecil seperti preferensi pengguna.
- **Local Storage (SQLite, Hive):** Lebih cocok untuk data besar dan kompleks yang memerlukan struktur yang baik.

Pilih metode penyimpanan yang sesuai dengan kebutuhan aplikasi Anda untuk memastikan performa dan pengalaman pengguna yang optimal.

