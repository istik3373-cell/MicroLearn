import 'package:flutter/material.dart';
import 'home.dart';
import 'materi.dart';

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
        scaffoldBackgroundColor: const Color(0xFFF8F9FC),
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
  // HALAMAN UTAMA YANG BISA DIAKSES
  // ===================================================

  final List<Widget> pages = const [
    HomePage(),
    MateriPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman sesuai menu yang dipilih
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      // =================================================
      // BOTTOM NAVIGATION
      // =================================================

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Materi',
          ),
        ],
      ),
    );
  }
}