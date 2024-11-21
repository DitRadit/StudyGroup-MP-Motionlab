
Apa itu Version Control?

Version Control adalah sistem yang digunakan untuk mengelola perubahan terhadap dokumen, file, 
atau kode sumber (source code) secara berkelanjutan. 

Fungsi dan Manfaat Version Control:
1. Pelacakan Perubahan
2. Kolaborasi
3. Pengelolaan versi
4. Manajemen Rilis

Apa itu Git?
Git adalah sistem version control terdistribusi yang sangat populer, digunakan untuk mengelola proyek pengembangan perangkat lunak. 
Git memungkinkan pengembang untuk melacak dan mengelola perubahan kode sumber dalam repositori (repository) dengan cara yang efisien dan fleksibel.

Command Git yang umum :
1. `git init` : Menginisialisasi repositori baru di dalam direktori.
2. `git config --global user.name "<username_akun_github>"`: Menyeting nama pengguna global.
3. `git config --global user.email "<email@example.com>"`: Menyeting email pengguna global.
4. `git status`: Menampilkan status perubahan di repositori (apakah ada file yang dimodifikasi, belum dilacak, dll).
5. `git clone <url repositori>` : Menyalin repositori Git dari server ke lokal.
6. `git remote add origin <URL-repository>` : Menyambungkan folder lokal ke repository GitHub
6. `git branch`: Menampilkan daftar cabang yang ada di repositori.
7. `git branch <nama branch>`: Membuat cabang baru.
8. `git checkout <nama branch>`: Berpindah ke cabang tertentu.
9. `git checkout -b <nama branch>`: Membuat dan langsung beralih ke cabang baru.
10. `git add <file>` : Menambahkan perubahan file ke staging area, menandakan bahwa file siap untuk di-commit.
11. `git commit -m "<pesan commit>"` : Menyimpan perubahan ke repositori dengan pesan yang menjelaskan perubahan yang dilakukan.
12. `git push` : Mengirim perubahan dari repositori lokal ke repositori remote.
13. `git pull` : Mengambil perubahan terbaru dari repositori remote dan menggabungkannya dengan repositori lokal.
14. `git log`: Menampilkan daftar commit yang telah dilakukan beserta detailnya.
15. `git reset <commit_id>` : Mengembalikan riwayat commit ke titik tertentu.

Step-step yang umum untuk mengepush file project ke repository jika repository dan folder lokal sudah dibuat
1. `git init` : Menginisialisasi repositori baru di dalam direktori.
2. `git add <file>` : Menambahkan perubahan file ke staging area, menandakan bahwa file siap untuk di-commit.
3. `git commit -m "<pesan commit>"` : Menyimpan perubahan ke repositori dengan pesan yang menjelaskan perubahan yang dilakukan.
4. `git remote add origin <url-repository-https>` : Menyambungkan folder lokal ke repository GitHub
5. `git pull origin main` : Mengambil perubahan terbaru dari repositori remote dan menggabungkannya dengan repositori lokal.
6. `git push origin main` : Push file lokal ke branch utama repository GitHub

Step-step yang umum untuk mengmerge branch lain ke branch utama
1. `git checkout main` : Berpindah ke branch utama.
2. `git pull origin main` : Mengambil perubahan terbaru dari repositori remote
3. `git merge <nama-branch-lain>` : Merge perubahan dari branch lain
4. `git push origin main` : Push file lokal ke branch utama repository GitHub

Menggunakan Github untuk merge branch lain
1. Buka GitHub dan pergi ke halaman repository.
2. Klik tombol "Create Pull requests" di bagian atas halaman.
3. Pilih Branch yang Ingin Digabung
4. Beri Deskripsi dan Nama PR
5. Buat Pull Request

Apa itu HTTPS dan SSH?

- HTTPS adalah versi aman dari HTTP yang digunakan untuk komunikasi antara browser dan server web dengan enkripsi menggunakan SSL/TLS.
Kelebihan:
1. Mudah digunakan, karena hanya memerlukan username dan password untuk autentikasi.
2. Digunakan secara luas di seluruh internet.

- SSH adalah protokol jaringan yang menyediakan cara aman untuk mengakses komputer atau server melalui jaringan tidak aman dengan menggunakan enkripsi.
Kelebihan:
1. Tidak memerlukan password setiap kali jika sudah mengonfigurasi kunci SSH (private/public keys), lebih aman dan praktis.
2. Ideal untuk penggunaan otomatis dan skrip.

HTTPS lebih sering digunakan untuk komunikasi web biasa dan lebih mudah diakses menggunakan username dan password.
SSH lebih aman dan sering digunakan untuk akses server jarak jauh serta autentikasi GitHub melalui kunci SSH, tanpa perlu memasukkan password setiap kali.

Step-step umum menggunakan SSH daripada HTTPS untuk mengpush file ke repository
1. `ssh-keygen -t ed25519 -C "<email_akun_github>"` : digunakan untuk menghasilkan kunci SSH dengan algoritma Ed25519 untuk autentikasi yang lebih aman ke server GitHub (atau server lain yang mendukung SSH). 
2. Klik enter 2 kali agar menggunakan passphrase default
3. `cat ~/.ssh/id_ed25519.pub` : menyalin konten dari file id_ed25519.pub ke clipboard dengan perintah
4. Masuk ke Akun GitHub > Settings > SSH and GPG keys > New SSH key.
5. Beri nama SSH key dan paste konten clipboard ke Key
6. Create SSH key
7. `ssh -T git@github.com` : Digunakan untuk menguji koneksi SSH Anda ke GitHub dan memverifikasi apakah SSH telah dikonfigurasi dengan benar. 
8. `git remote set-url origin git@github.com:<username>/<repository>.git` : digunakan untuk mengubah URL remote origin di repositori Git Anda ke URL SSH, agar Anda dapat mengakses repositori GitHub menggunakan koneksi SSH (bukan HTTPS).
