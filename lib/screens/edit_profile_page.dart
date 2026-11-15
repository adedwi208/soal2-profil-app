import 'package:flutter/material.dart';

import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _namaController;
  late final TextEditingController _nimController;
  late final TextEditingController _prodiController;
  late final TextEditingController _kelasController;
  late final TextEditingController _bioController;
  late final TextEditingController _emailController;
  late final TextEditingController _hpController;
  late final TextEditingController _githubController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.profile.nama);
    _nimController = TextEditingController(text: widget.profile.nim);
    _prodiController = TextEditingController(text: widget.profile.prodi);
    _kelasController = TextEditingController(text: widget.profile.kelas);
    _bioController = TextEditingController(text: widget.profile.bio);
    _emailController = TextEditingController(text: widget.profile.email);
    _hpController = TextEditingController(text: widget.profile.hp);
    _githubController = TextEditingController(text: widget.profile.github);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  // ---------- FUNGSI VALIDATOR ----------
  // Aturan validator: return null = valid, return teks = pesan error.

  // Nama wajib diisi. trim() membuang spasi di awal/akhir,
  // jadi kalau isinya spasi doang tetap dianggap kosong.
  String? _validasiNama(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama wajib diisi';
    }
    return null;
  }

  String? _validasiEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }

    final email = value.trim();

    final posisiAt = email.indexOf('@');
    final posisiAtTerakhir = email.lastIndexOf('@');
    final posisiTitik = email.lastIndexOf('.');

    if (email.contains(' ')) {
      return 'Email tidak boleh mengandung spasi';
    }
    if (posisiAt == -1 || posisiAt != posisiAtTerakhir) {
      return 'Email harus mengandung satu tanda @';
    }
    if (posisiAt == 0) {
      return 'Email harus ada nama sebelum @';
    }
    if (posisiTitik < posisiAt + 2 || posisiTitik == email.length - 1) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? _validasiHp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor HP wajib diisi';
    }

    final hp = value.trim();

    for (int i = 0; i < hp.length; i++) {
      if (!'0123456789'.contains(hp[i])) {
        return 'Nomor HP hanya boleh berisi angka';
      }
    }

    if (hp.length < 10 || hp.length > 13) {
      return 'Nomor HP harus 10-13 digit';
    }
    return null;
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data valid (belum disimpan)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField(
                controller: _namaController,
                label: 'Nama Lengkap',
                icon: Icons.person,
                validator: _validasiNama,
              ),
              _buildField(
                controller: _nimController,
                label: 'NIM',
                icon: Icons.badge,
              ),
              _buildField(
                controller: _prodiController,
                label: 'Program Studi',
                icon: Icons.school,
              ),
              _buildField(
                controller: _kelasController,
                label: 'Kelas',
                icon: Icons.class_,
              ),
              _buildField(
                controller: _bioController,
                label: 'Bio',
                icon: Icons.notes,
                maxLines: 3,
              ),
              _buildField(
                controller: _emailController,
                label: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: _validasiEmail,
              ),
              _buildField(
                controller: _hpController,
                label: 'Nomor HP',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: _validasiHp,
              ),
              _buildField(
                controller: _githubController,
                label: 'GitHub',
                icon: Icons.code,
              ),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _simpan,
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
