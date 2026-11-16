import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Keahlian dan Hobi',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),

          const Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Pemrograman Web'),
              subtitle: Text('Laravel dan PostgreSQL'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Pengembangan Aplikasi Mobile'),
              subtitle: Text('Flutter dan Dart'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.computer),
              title: Text('Aplikasi Desktop'),
              subtitle: Text('Java Swing'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.sports_esports),
              title: Text('Hobi: Bermain Game'),
              subtitle: Text('Game strategi dan petualangan'),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Riwayat Pendidikan',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),

          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('SD Negeri Karet 1 Sepatan'),
              subtitle: Text('2009 - 2012'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('SMP Negeri 2 Sepatan'),
              subtitle: Text('2017 - 2019'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('SMK Negeri 6 Tangerang'),
              subtitle: Text('2020 - 2023'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('Bina Sarana Global - Teknik Informatika'),
              subtitle: Text('2024 - sekarang'),
            ),
          ),
        ],
      ),
    );
  }
}
