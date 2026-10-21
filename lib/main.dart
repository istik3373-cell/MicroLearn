
import 'package:flutter/material.dart';
import 'home.dart';
import 'materi.dart';
import 'profil.dart';

void main() {
  runApp(const MikroLearnApp());
}

// =====================================================
// APLIKASI MIKROLEARN
// =====================================================

class MikroLearnApp extends StatelessWidget {
  const MikroLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MikroLearn',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
        ),
        scaffoldBackgroundColor: const Color(0xFF090B20),
      ),

      home: const MainPage(),
    );
  }
}

// =====================================================
// MAIN PAGE
// =====================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  // ===================================================
  // DAFTAR HALAMAN
  // ===================================================

  final List<Widget> pages = const [
    HomePage(),
    MateriPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090B20),

      // Menampilkan halaman sesuai menu yang dipilih
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      // =================================================
      // BOTTOM NAVIGATION
      // =================================================

      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF141832),
        indicatorColor: const Color(0xFF4263FF).withValues(alpha: 0.25),
        elevation: 0,
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white60,
            ),
            selectedIcon: Icon(
              Icons.home_rounded,
              color: Color(0xFF46E8FF),
            ),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.menu_book_outlined,
              color: Colors.white60,
            ),
            selectedIcon: Icon(
              Icons.menu_book_rounded,
              color: Color(0xFF46E8FF),
            ),
            label: 'Materi',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.person_outline_rounded,
              color: Colors.white60,
            ),
            selectedIcon: Icon(
              Icons.person_rounded,
              color: Color(0xFFFF4FA3),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
