Aplikasi ATM Command-Line

Ini adalah program simulasi ATM sederhana yang ditulis dalam Dart yang memungkinkan pengguna untuk melakukan setoran, penarikan, dan memeriksa saldo mereka secara interaktif melalui command line. Program ini memiliki penanganan kesalahan dasar untuk input yang tidak valid dan memastikan bahwa pengguna hanya dapat menarik uang jika saldo mencukupi.

Fitur :
Deposit: Menyetor uang ke akun Anda.
Withdraw: Menarik uang dari akun Anda, dengan validasi saldo yang cukup.
Check Balance: Memeriksa saldo akun Anda.
Input Validation: Memastikan bahwa input untuk jumlah setoran dan penarikan adalah angka positif.

Run aplikasi Dart:
'dart run'


Program akan dimulai, dan Anda akan melihat menu berbasis teks sederhana:
=== Command Line Bank ===
1. Deposit
2. Balance
3. Withdraw
4. Exit

Anda dapat memilih opsi dengan memasukkan nomor yang sesuai dengan tindakan yang ingin Anda lakukan:

Setor: Masukkan jumlah yang ingin disetor ke akun Anda.
Saldo: Melihat saldo saat ini.
Tarik: Masukkan jumlah yang ingin ditarik (jika saldo mencukupi).
Keluar: Keluar dari program.

Struktur Kode
Project ini terdiri dari tiga file utama:

atmEntity.dart: Mendefinisikan kelas Atmentity, yang menyimpan informasi saldo dan menyediakan metode untuk mengubah saldo.
atmLogic.dart: Berisi kelas Atmlogic, yang mengenkapsulasi operasi ATM seperti setoran, penarikan, dan pemeriksaan saldo.
main.dart: Titik masuk dari program, di mana logika utama untuk berinteraksi dengan pengguna ditangani. Ini mencakup menu ATM dan validasi input pengguna.

Contoh penggunaan:
////////////////////////////////
=== Command Line Bank===
1. Deposit
2. Balance
3. Withdraw
4. Exit
Choose an option: 1
Enter deposit amount: 200
Deposit successful. Your new balance is: Rp2200.0

Do you want to perform another transaction? (y/n): n

Thank you for using the ATM.
////////////////////////////////