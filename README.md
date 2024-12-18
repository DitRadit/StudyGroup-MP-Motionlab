# State Management dan Implementasi GetX

## 1. Apa itu State Management?

State management adalah cara mengelola data (state) dalam sebuah aplikasi agar tetap konsisten dan sinkron di berbagai bagian aplikasi. State bisa berupa data seperti:

- Jumlah barang dalam keranjang belanja
- Status login pengguna
- Tema aplikasi (terang/gelap)

Dengan state management, perubahan data dapat secara otomatis diperbarui di UI tanpa perlu pembaruan manual.

## 2. Apa itu Peruntukan State?

Peruntukan state mengacu pada bagaimana dan di mana data (state) diatur dalam aplikasi. Terdapat dua jenis utama:

### a. Global State

State yang dapat diakses di seluruh aplikasi. Contohnya adalah status login pengguna atau tema aplikasi.

### b. Local State

State yang hanya digunakan dalam bagian tertentu dari aplikasi, seperti dalam satu widget atau layar tertentu.

## 3. Apa itu GetX?

GetX adalah library Flutter yang ringan dan efisien untuk:

- **Manajemen state**: Mengelola perubahan data agar UI responsif tanpa boilerplate.
- **Manajemen rute**: Navigasi antar layar dengan cara sederhana.
- **Dependensi**: Mengatur dependensi seperti controller atau layanan.

### Keuntungan GetX:

- Tidak memerlukan banyak boilerplate.
- UI responsif terhadap perubahan data secara otomatis.
- Ringan dan cepat.

---

## 4. Contoh Implementasi GetX

### a. Membuat Controller

Controller digunakan untuk mengelola state. Dalam contoh ini, kita membuat controller bernama `CartController`:

```dart
import 'package:get/get.dart';

class CartController extends GetxController {
  final quantity = 0.obs; // State reaktif

  void quantityIncrement() => quantity.value++;
  void quantityDecrement() => quantity.value--;
}
```

Penjelasan:

- `quantity`: Variabel reaktif menggunakan `.obs`, sehingga perubahan nilainya dapat langsung diperbarui di UI.
- `quantityIncrement`: Fungsi untuk menambah nilai `quantity`.
- `quantityDecrement`: Fungsi untuk mengurangi nilai `quantity`.

### b. Menggunakan Controller dalam Widget

Berikut adalah implementasi controller di dalam widget:

```dart
final cartController = CartController();

ProductCard(
  imageUrl: "assets/images/smartwatch.png",
  title: "Mi Band 8 Pro - Brand\nNew",
  price: "\$54.00",
  quantity: cartController.quantity.value,
  quantityIncrement: cartController.quantityIncrement,
  quantityDecrement: cartController.quantityDecrement,
),

ProductCard(
  imageUrl: "assets/images/baju.png",
  title: "Lycra Men’s shirt",
  price: "\$12.00",
  quantity: cartController.quantity.value,
  quantityIncrement: cartController.quantityIncrement,
  quantityDecrement: cartController.quantityDecrement,
),
```

### c. Masalah dalam Kode

Kedua produk berbagi state yang sama (`cartController.quantity`). Jika jumlah barang pada satu produk diubah, produk lain juga akan memperlihatkan perubahan yang sama.

### d. Solusi: Membuat State Terpisah untuk Setiap Produk

Setiap produk harus memiliki state `quantity` sendiri. Berikut adalah solusi menggunakan model `Product`:

#### Membuat Model Produk

```dart
class Product {
  String imageUrl;
  String title;
  String price;
  RxInt quantity;

  Product({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

final productList = [
  Product(
    imageUrl: "assets/images/smartwatch.png",
    title: "Mi Band 8 Pro - Brand\nNew",
    price: "\$54.00",
    quantity: 0.obs,
  ),
  Product(
    imageUrl: "assets/images/baju.png",
    title: "Lycra Men’s shirt",
    price: "\$12.00",
    quantity: 0.obs,
  ),
];
```

#### Menggunakan Model dalam Widget

```dart
ProductCard(
  imageUrl: product.imageUrl,
  title: product.title,
  price: product.price,
  quantity: product.quantity.value,
  quantityIncrement: () => product.quantity.value++,
  quantityDecrement: () => product.quantity.value--,
);
```

Dengan pendekatan ini, setiap produk memiliki state `quantity` sendiri.

---

## 5. Kesimpulan

- **State Management** adalah konsep penting untuk mengelola data dalam aplikasi.
- **GetX** mempermudah manajemen state dengan cara yang sederhana, reaktif, dan efisien.
- Untuk kasus seperti keranjang belanja, penting untuk memisahkan state setiap produk agar tidak saling berbagi data yang tidak relevan.
