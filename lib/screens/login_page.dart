import 'package:flutter/material.dart';

import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  // Kredensial yang dianggap benar (simulasi, karena belum ada server).
  // Ganti sesuai keinginan lu.
  static const String _validEmail = 'admin@gmail.com';
  static const String _validPassword = '123456';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi bantu untuk menampilkan notifikasi (SnackBar) di bagian bawah layar.
  // isSuccess true = hijau, false = merah.
  void _showMessage(String message, {required bool isSuccess}) {
    // ScaffoldMessenger mengatur SnackBar. hideCurrentSnackBar() menutup
    // notifikasi lama supaya tidak menumpuk kalau tombol ditekan berkali-kali.
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isSuccess ? Colors.green : Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  Future<void> _login() async {
    // Validasi form dulu (kosong / format salah dicegat di sini)
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulasi proses login ke server selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    // Pastikan halaman masih ada setelah menunggu
    if (!mounted) return;

    setState(() => _isLoading = false);

    // Bandingkan input dengan kredensial yang benar.
    // trim() membuang spasi di awal/akhir email.
    final emailBenar = _emailController.text.trim() == _validEmail;
    final passwordBenar = _passwordController.text == _validPassword;

    if (emailBenar && passwordBenar) {
      // BERHASIL: tampilkan notif hijau lalu pindah halaman.
      // SnackBar tetap terlihat di halaman berikutnya karena
      // ScaffoldMessenger dimiliki oleh MaterialApp, bukan halaman ini.
      _showMessage('Login berhasil', isSuccess: true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    } else {
      // GAGAL: tampilkan notif merah dan tetap di halaman login.
      _showMessage('Login gagal: email atau password salah', isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 96),
                  const SizedBox(height: 16),
                  Text(
                    'Selamat Datang',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email wajib diisi';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password wajib diisi';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
