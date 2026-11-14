import 'package:flutter/material.dart';

// Widget kecil yang dipakai ulang untuk satu baris kontak:
// ikon di kiri, label kecil di atas, nilai di bawahnya.
// Dipisah ke file sendiri supaya kodenya tidak diulang-ulang
// (sesuai struktur "widgets/ = widget yang dipakai ulang").
class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // ListTile = baris siap pakai dengan leading (kiri), title, dan subtitle.
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
