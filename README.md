# UTS Pemrograman Aplikasi Mobile - Aplikasi Profil Mahasiswa

Aplikasi profil mahasiswa berbasis Flutter yang dibuat untuk Ujian Tengah Semester mata kuliah Pemrograman Aplikasi Mobile.

---

## Identitas Mahasiswa

| | |
|---|---|
| **Nama** | Ade Dwi Herdiansyah |
| **NIM** | 1124160201 |
| **Kelas** | TI 24 P SE-3 |
| **Program Studi** | Teknik Informatika |
| **Universitas** | Institut Teknologi & Bisnis Bina Sarana Global |

---

## Video Presentasi

Link YouTube: (https://youtu.be/EWE4QS9HbV0)

---

## Screenshot Aplikasi

| Halaman Login | Dashboard Profil | Edit Profil |
|:---:|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/0c545c6e-129a-4f19-9d68-4f95ce56193b" width="200" alt="Halaman Login"> | <img src="https://github.com/user-attachments/assets/11ba0d8f-2d57-470e-bd47-e5d7e33f0ba5" width="200" alt="Dashboard Profil"> | <img src="https://github.com/user-attachments/assets/8b9e531d-5110-42be-a23a-b347c3e712a1" width="200" alt="Edit Profil"> |

---

## Akun untuk Login

| Email | Password |
|---|---|
| `ade123@gmail.com` | `123456` |

---

## Cara Menjalankan

```bash
flutter pub get
flutter run
```

---

## Fitur Aplikasi

### 1. Halaman Login (`LoginPage`)
- Validasi input menggunakan `Form` dan `GlobalKey<FormState>` (kolom wajib diisi, format email mengandung `@`, dan password minimal 6 karakter).
- Indikator *loading* (`CircularProgressIndicator`) saat proses autentikasi berlangsung, dan tombol dinonaktifkan agar tidak ditekan dua kali.
- Pengecekan kredensial dengan notifikasi `SnackBar` hijau saat berhasil dan merah saat gagal.
- Navigasi ke halaman profil menggunakan `Navigator.pushReplacement` sehingga halaman login tidak bisa dikembalikan dengan tombol Back.

### 2. Halaman Profil (`ProfilePage`)
- Menampilkan foto profil dari folder `assets/images/` menggunakan `CircleAvatar`, beserta nama lengkap, NIM, program studi, kelas, dan bio singkat.
- Kartu Kontak (Email, Nomor HP, Akun GitHub) menggunakan `Card` dan widget kustom `InfoTile` (berbasis `ListTile` dengan ikon).
- `Drawer` sebagai menu navigasi ke halaman Profil dan **Tentang Saya**, serta `Switch` **Mode Gelap** untuk mengganti tema terang dan gelap secara langsung.
- `FloatingActionButton` untuk membuka halaman Edit Profil.

### 3. Halaman Edit Profil (`EditProfilePage`)
- Form berisi data profil saat ini (*pre-filled*) menggunakan `TextEditingController` yang diinisialisasi pada `initState()`.
- Validasi input: nama wajib diisi, format email valid, dan nomor HP hanya angka sepanjang 10-13 digit.
- Pengiriman data pembaruan kembali ke `ProfilePage` menggunakan `Navigator.pop(context, dataBaru)` yang memicu `setState()` sehingga data baru langsung tampil, disertai notifikasi `SnackBar`.

### 4. Halaman Tentang Saya (`AboutPage`)
- Menampilkan daftar **Keahlian dan Hobi** serta **Riwayat Pendidikan** menggunakan `ListView` dan `Card`.

### 5. Tema dan Identitas Aplikasi
- `theme` dan `darkTheme` dengan warna sendiri (`ColorScheme.fromSeed`). Perubahan `themeMode` dilakukan langsung lewat `setState()` di `MyApp` tanpa perlu restart aplikasi.
- Nama aplikasi di perangkat Android diubah menjadi **Profil Ade** melalui atribut `android:label` pada `AndroidManifest.xml`.
---

## Download Aplikasi

[Unduh APK (v1.0.0)](https://github.com/USERNAME/NAMA-REPO/releases/latest)
