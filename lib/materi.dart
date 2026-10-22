
import 'package:flutter/material.dart';
import 'app_storage.dart';
import 'kartu_pembelajaran.dart';

const Color bgColor = Color(0xFF090B20);
const Color cardColor = Color(0xFF141832);
const Color neonBlue = Color(0xFF4263FF);
const Color neonPink = Color(0xFFFF4FA3);
const Color neonCyan = Color(0xFF46E8FF);
const Color softText = Color(0xFFA7B0D0);

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  static const List<Map<String, dynamic>> materiList = [
    {
      'title': 'Pengenalan Komputer',
      'desc': 'Kenali dasar komputer dan cara kerjanya.',
      'icon': Icons.computer_rounded,
      'color': neonBlue,
      'jumlah': '5 kartu',
    },
    {
      'title': 'Perangkat Keras',
      'desc': 'Pelajari perangkat input, output, dan lainnya.',
      'icon': Icons.devices_rounded,
      'color': neonPink,
      'jumlah': '7 kartu',
    },
    {
      'title': 'Komponen Internal',
      'desc': 'Kenali CPU, RAM, motherboard, dan komponen lain.',
      'icon': Icons.memory_rounded,
      'color': neonCyan,
      'jumlah': '6 kartu',
    },
    {
      'title': 'Perangkat Lunak',
      'desc': 'Pelajari sistem operasi dan aplikasi komputer.',
      'icon': Icons.code_rounded,
      'color': Color(0xFFAA63FF),
      'jumlah': '5 kartu',
    },
    {
      'title': 'Fungsi dan Kegunaan Perangkat',
      'desc': 'Pahami fungsi setiap perangkat komputer.',
      'icon': Icons.settings_suggest_rounded,
      'color': Color(0xFFFFB454),
      'jumlah': '5 kartu',
    },
  ];

  Future<void> _bukaMateri(
    BuildContext context,
    String title,
  ) async {
    await AppStorage.addHistory(title);

    if (!context.mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => KartuPembelajaranPage(
          judul: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -80,
            child: _GlowCircle(
              color: neonPink.withOpacity(0.12),
              size: 260,
            ),
          ),
          Positioned(
            top: 350,
            left: -130,
            child: _GlowCircle(
              color: neonBlue.withOpacity(0.12),
              size: 250,
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 850),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          24, 24, 24, 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: neonPink.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: neonPink.withOpacity(0.45),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.auto_stories_rounded,
                                    color: neonPink,
                                    size: 23,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MIKROLEARN',
                                      style: TextStyle(
                                        color: neonCyan,
                                        fontSize: 11,
                                        letterSpacing: 3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Learning Center',
                                      style: TextStyle(
                                        color: softText,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.circular(13),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.08),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.bolt_rounded,
                                    color: neonPink,
                                    size: 21,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 34),
                            const Text(
                              'EXPLORE YOUR',
                              style: TextStyle(
                                color: neonPink,
                                fontSize: 12,
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Materi Pembelajaran',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.7,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Upgrade pengetahuanmu, satu kartu dalam satu waktu.',
                              style: TextStyle(
                                color: softText,
                                fontSize: 13,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Highlight card
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF24285A),
                                    Color(0xFF17172F),
                                    Color(0xFF30162F),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                  color: neonPink.withOpacity(0.35),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: neonPink.withOpacity(0.08),
                                    blurRadius: 25,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'YOUR NEXT LEVEL',
                                          style: TextStyle(
                                            color: neonCyan,
                                            fontSize: 10,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Siap belajar\nhal baru?',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            height: 1.3,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Pilih topik dan mulai petualanganmu.',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.7),
                                            fontSize: 11,
                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 74,
                                    height: 74,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: neonPink.withOpacity(0.1),
                                      border: Border.all(
                                        color: neonPink.withOpacity(0.55),
                                        width: 1.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: neonPink.withOpacity(0.12),
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.rocket_launch_rounded,
                                      color: neonPink,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const Text(
                                  'Pilih Topik',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '${materiList.length} MODULES',
                                  style: const TextStyle(
                                    color: neonCyan,
                                    fontSize: 10,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Materi singkat untuk perjalanan belajarmu.',
                              style: TextStyle(
                                color: softText,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),

                    // List materi
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
                      sliver: SliverLayoutBuilder(
                        builder: (context, constraints) {
                          final crossAxisCount =
                              constraints.crossAxisExtent >= 620 ? 2 : 1;

                          return SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              mainAxisExtent: 145,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final materi = materiList[index];
                                final title = materi['title'] as String;

                                return _MateriCard(
                                  title: title,
                                  description: materi['desc'] as String,
                                  icon: materi['icon'] as IconData,
                                  color: materi['color'] as Color,
                                  jumlah: materi['jumlah'] as String,
                                  number: '${index + 1}'.padLeft(2, '0'),
                                  onTap: () => _bukaMateri(
                                    context,
                                    title,
                                  ),
                                );
                              },
                              childCount: materiList.length,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MateriCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String jumlah;
  final String number;
  final VoidCallback onTap;

  const _MateriCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.jumlah,
    required this.number,
    required this.onTap,
  });

  @override
  State<_MateriCard> createState() => _MateriCardState();
}

class _MateriCardState extends State<_MateriCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _glowAnimation = Tween<double>(
      begin: 0.08,
      end: 0.38,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _controller.forward();

    if (!mounted) return;

    await _controller.reverse();

    if (!mounted) return;

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(_glowAnimation.value),
                  blurRadius: 24,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: child,
          ),
        );
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          borderRadius: BorderRadius.circular(20),
          child: Ink(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: widget.color.withOpacity(0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: widget.color.withOpacity(0.6),
                      ),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.color,
                      size: 27,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MODULE ${widget.number}',
                          style: TextStyle(
                            color: widget.color,
                            fontSize: 9,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: softText,
                            fontSize: 10,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            Icon(
                              Icons.layers_rounded,
                              size: 12,
                              color: widget.color,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.jumlah,
                              style: TextStyle(
                                color: widget.color,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: widget.color,
                    size: 15,
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

class _GlowCircle extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowCircle({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 100,
              spreadRadius: 35,
            ),
          ],
        ),
      ),
    );
  }
}
