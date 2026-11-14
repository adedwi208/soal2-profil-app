// Model = cetakan data. Satu objek Profile menyimpan semua data satu orang.
class Profile {
  // final = nilainya tidak bisa diubah setelah objek dibuat.
  // Kalau data mau diganti (saat edit), kita bikin objek Profile BARU.
  final String nama;
  final String nim;
  final String prodi;
  final String kelas;
  final String bio;
  final String email;
  final String hp;
  final String github;

  // required = wajib diisi saat membuat objek.
  const Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
  });
}
