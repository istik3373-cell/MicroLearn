
import 'package:flutter/material.dart';
import 'materi.dart';

const bg = Color(0xFF090B20);
const panel = Color(0xFF151832);
const blue = Color(0xFF4263FF);
const pink = Color(0xFFFF4FA3);
const purple = Color(0xFFAA63FF);
const cyan = Color(0xFF46E8FF);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openMateri(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MateriPage()),
    );
  }

  void info(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: purple,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -80,
            child: glow(purple, 220),
          ),
          Positioned(
            top: 400,
            left: -130,
            child: glow(blue, 220),
          ),
          Positioned(
            bottom: 0,
            right: -100,
            child: glow(pink, 200),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1050),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HEADER
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [blue, purple, pink],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: purple.withOpacity(0.4),
                                  blurRadius: 18,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.memory_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MikroLearn',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'YOUR DIGITAL LEARNING SPACE',
                                  style: TextStyle(
                                    color: cyan,
                                    fontSize: 9,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          iconButton(
                            Icons.notifications_none_rounded,
                            () => info(context, 'Belum ada notifikasi.'),
                          ),
                          const SizedBox(width: 8),
                          iconButton(
                            Icons.person_rounded,
                            () => info(context, 'Profil segera hadir!'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      const Text(
                        'WELCOME BACK, PLAYER ✨',
                        style: TextStyle(
                          color: pink,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Hai, Sobat Milearn! ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Siap upgrade skill teknologi kamu hari ini?',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 22),

                      // STATUS PLAYER
                      Row(
                        children: [
                          Expanded(
                            child: stat(
                              Icons.local_fire_department_rounded,
                              '3 Hari',
                              'STREAK',
                              pink,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: stat(
                              Icons.stars_rounded,
                              '120 XP',
                              'TOTAL XP',
                              cyan,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: stat(
                              Icons.military_tech_rounded,
                              'Level 2',
                              'PLAYER',
                              purple,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      sectionTitle(
                        'Lanjutkan Belajar',
                        'YOUR NEXT MISSION',
                        cyan,
                      ),
                      const SizedBox(height: 14),

                      // HERO CARD
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF304BEE),
                              Color(0xFF7439D7),
                              Color(0xFFB82C93),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white24,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: purple.withOpacity(0.25),
                              blurRadius: 22,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.laptop_mac_rounded,
                                  color: cyan,
                                  size: 38,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'PENGENALAN KOMPUTER',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.auto_awesome,
                                  color: Color(0xFFFFD166),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Kenali komputer, fungsi, dan komponen dasarnya.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 18),
                            const Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Progress awal',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const LinearProgressIndicator(
                                value: 0,
                                minHeight: 9,
                                backgroundColor: Color(0x66FFFFFF),
                                valueColor:
                                    AlwaysStoppedAnimation(cyan),
                              ),
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () => openMateri(context),
                                icon: const Icon(Icons.rocket_launch_rounded),
                                label: const Text('MULAI BELAJAR'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: pink,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(13),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      sectionTitle(
                        'Jelajahi Materi',
                        'PILIH MISI BELAJARMU',
                        purple,
                      ),
                      const SizedBox(height: 14),

                      // CATEGORY CARDS
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final wide = constraints.maxWidth > 650;
                          final count = wide ? 3 : 2;

                          final items = [
                            ('Pengenalan Komputer',
                                Icons.desktop_windows_rounded, blue),
                            ('Perangkat Keras',
                                Icons.keyboard_rounded, pink),
                            ('Komponen Internal',
                                Icons.memory_rounded, cyan),
                            ('Perangkat Lunak',
                                Icons.widgets_rounded, purple),
                            ('Fungsi dan Kegunaan',
                                Icons.settings_suggest_rounded,
                                const Color(0xFFFFA35C)),
                          ];

                          return GridView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: count,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: wide ? 1.5 : 1.15,
                            ),
                            itemBuilder: (context, index) {
                              final item = items[index];

                              return InkWell(
                                onTap: () => openMateri(context),
                                borderRadius: BorderRadius.circular(19),
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: panel,
                                    borderRadius:
                                        BorderRadius.circular(19),
                                    border: Border.all(
                                      color: item.$3.withOpacity(0.5),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: item.$3.withOpacity(0.08),
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color:
                                              item.$3.withOpacity(0.13),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Icon(
                                          item.$2,
                                          color: item.$3,
                                          size: 27,
                                        ),
                                      ),
                                      Text(
                                        item.$1,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Buka materi',
                                              style: TextStyle(
                                                color: item.$3,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_rounded,
                                            color: item.$3,
                                            size: 17,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 28),

                      // DAILY CHALLENGE
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF291738),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: pink.withOpacity(0.5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.track_changes_rounded,
                                  color: pink,
                                  size: 28,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Tantangan Hari Ini',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Uji pengetahuanmu! 🧠',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              'Pelajari materi lalu kerjakan mini quiz untuk menguji pemahamanmu.',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 12,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '⭐ Target: 5 soal mini quiz',
                              style: TextStyle(
                                color: Color(0xFFFFD166),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => openMateri(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: pink,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                child: const Text('MULAI TANTANGAN →'),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      sectionTitle(
                        'Akses Cepat',
                        'YOUR SHORTCUTS',
                        cyan,
                      ),
                      const SizedBox(height: 14),

                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 2.2,
                        children: [
                          quick(
                            Icons.bookmark_rounded,
                            'Bookmark',
                            purple,
                            () => info(
                              context,
                              'Bookmark segera tersedia.',
                            ),
                          ),
                          quick(
                            Icons.history_rounded,
                            'Riwayat',
                            pink,
                            () => info(
                              context,
                              'Riwayat belajar segera tersedia.',
                            ),
                          ),
                          quick(
                            Icons.bar_chart_rounded,
                            'Progress',
                            cyan,
                            () => info(
                              context,
                              'Progress belajar segera tersedia.',
                            ),
                          ),
                          quick(
                            Icons.settings_rounded,
                            'Pengaturan',
                            blue,
                            () => info(
                              context,
                              'Pengaturan segera tersedia.',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // ACHIEVEMENTS
                      sectionTitle(
                        'Pencapaian Saya',
                        'UNLOCK YOUR POTENTIAL',
                        const Color(0xFFFFD166),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          achievement(
                            Icons.flag_rounded,
                            'Pemula',
                            'Mulai perjalanan',
                            pink,
                          ),
                          const SizedBox(width: 10),
                          achievement(
                            Icons.quiz_rounded,
                            'Quiz Master',
                            'Selesaikan quiz',
                            Colors.white38,
                          ),
                          const SizedBox(width: 10),
                          achievement(
                            Icons.bolt_rounded,
                            'Konsisten',
                            'Terus belajar',
                            Colors.white38,
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      const Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite_rounded,
                              color: pink,
                              size: 24,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'BELAJAR • BERKEMBANG • JADI VERSI TERBAIK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: cyan,
                                fontSize: 9,
                                letterSpacing: 1.1,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              'Kamu hebat karena terus mencoba ✨',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget glow(Color color, double size) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.17),
              blurRadius: size * 0.55,
              spreadRadius: size * 0.12,
            ),
          ],
        ),
      ),
    );
  }

  static Widget iconButton(
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: 43,
        height: 43,
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: Colors.white12),
        ),
        child: Icon(icon, color: Colors.white70),
      ),
    );
  }

  static Widget stat(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 9,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget sectionTitle(
    String title,
    String subtitle,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 38,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 9,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  color: color,
                  fontSize: 9,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget quick(
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.35)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 25),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: color,
              size: 13,
            ),
          ],
        ),
      ),
    );
  }

  static Widget achievement(
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 29),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
