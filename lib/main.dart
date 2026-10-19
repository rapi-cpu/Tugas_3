
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        title: const Text('Kartu Profil'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool wide = constraints.maxWidth > 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: wide
                      ? Row(
                    children: [
                      Expanded(child: _buildAvatar()),
                      const SizedBox(width: 28),
                      Expanded(
                        flex: 2,
                        child: _buildInfo(),
                      ),
                    ],
                  )
                      : Column(
                    children: [
                      _buildAvatar(),
                      const SizedBox(height: 24),
                      _buildInfo(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo.shade50,
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: const Icon(
              Icons.person,
              size: 90,
              color: Colors.indigo,
            ),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Available',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Muhammad Abdulloh Syarofi',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Mahasiswa Sistem Informasi',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Saya tertarik mempelajari teknologi, '
              'pengembangan aplikasi, dan desain antarmuka '
              'yang sederhana serta mudah digunakan.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 20),

        // Wrap: chip otomatis berpindah baris
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Keahlian',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: const [
            Chip(label: Text('Flutter')),
            Chip(label: Text('UI Design')),
            Chip(label: Text('Dart')),
            Chip(label: Text('GitHub')),
          ],
        ),
        const Divider(height: 32),

        // Row: ikon kontak tersusun horizontal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _ContactIcon(
              icon: Icons.email_outlined,
              label: 'Email',
            ),
            _ContactIcon(
              icon: Icons.phone_outlined,
              label: 'Telepon',
            ),
            _ContactIcon(
              icon: Icons.code,
              label: 'GitHub',
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactIcon({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.indigo, size: 28),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
