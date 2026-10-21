import 'package:flutter/material.dart';
import 'quiz.dart';

const Color bgColor = Color(0xFF090B20);
const Color panelColor = Color(0xFF141832);
const Color neonBlue = Color(0xFF4263FF);
const Color neonPink = Color(0xFFFF4FA3);
const Color neonCyan = Color(0xFF46E8FF);
const Color softText = Color(0xFFA7B0D0);

class KartuPembelajaranPage extends StatefulWidget {
  final String judul;

  const KartuPembelajaranPage({
    super.key,
    required this.judul,
  });

  @override
  State<KartuPembelajaranPage> createState() =>
      _KartuPembelajaranPageState();
}

class _KartuPembelajaranPageState
    extends State<KartuPembelajaranPage>
    with SingleTickerProviderStateMixin {
  int currentCard = 0;
  bool isChanging = false;

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  final List<Map<String, String>> cards = [
    {
      'judul': 'Apa Itu Komputer?',
      'isi':
          'Komputer adalah perangkat elektronik yang dapat menerima, mengolah, menyimpan, dan menghasilkan informasi berdasarkan instruksi yang diberikan.',
    },
    {
      'judul': 'Fungsi Komputer',
      'isi':
          'Komputer digunakan untuk mengolah data, menyimpan informasi, menjalankan berbagai aplikasi, serta membantu menyelesaikan pekerjaan dengan lebih cepat.',
    },
    {
      'judul': 'Komponen Komputer',
      'isi':
          'Komputer terdiri dari beberapa komponen utama, seperti perangkat keras, perangkat lunak, dan pengguna yang menjalankan sistem.',
    },
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.96,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> changeCard(int index) async {
    if (isChanging || index < 0 || index >= cards.length) return;

    setState(() {
      isChanging = true;
    });

    await _animationController.reverse();
    if (!mounted) return;

    setState(() {
      currentCard = index;
    });

    await _animationController.forward();
    if (!mounted) return;

    setState(() {
      isChanging = false;
    });
  }

  Future<void> nextCard() async {
    if (isChanging) return;

    if (currentCard < cards.length - 1) {
      await changeCard(currentCard + 1);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(
            judulMateri: widget.judul,
          ),
        ),
      );
    }
  }

  Future<void> previousCard() async {
    if (currentCard > 0) {
      await changeCard(currentCard - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final card = cards[currentCard];
    final progress = (currentCard + 1) / cards.length;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.judul,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: neonBlue.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: neonBlue.withOpacity(0.6),
                      ),
                    ),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      color: neonCyan,
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LEARNING MODULE',
                          style: TextStyle(
                            color: neonCyan,
                            fontSize: 10,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kartu Pembelajaran',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: panelColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: neonBlue.withOpacity(0.5),
                      ),
                    ),
                    child: Text(
                      '${currentCard + 1}/${cards.length}',
                      style: const TextStyle(
                        color: neonCyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PROGRESS BELAJAR',
                    style: TextStyle(
                      color: softText,
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${(progress * 100).round()}%',
                    style: const TextStyle(
                      color: neonCyan,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(end: progress),
                  duration: const Duration(milliseconds: 350),
                  builder: (context, value, child) {
                    return LinearProgressIndicator(
                      value: value,
                      minHeight: 7,
                      backgroundColor: panelColor,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(neonCyan),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: panelColor,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color: neonBlue.withOpacity(0.65),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: neonBlue.withOpacity(0.16),
                            blurRadius: 28,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: neonCyan.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(
                              Icons.auto_awesome_rounded,
                              color: neonCyan.withOpacity(0.35),
                              size: 25,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: neonBlue.withOpacity(0.12),
                                  border: Border.all(
                                    color: neonCyan.withOpacity(0.65),
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: neonCyan.withOpacity(0.12),
                                      blurRadius: 24,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.memory_rounded,
                                  size: 48,
                                  color: neonCyan,
                                ),
                              ),

                              const SizedBox(height: 28),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: neonPink.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: neonPink.withOpacity(0.4),
                                  ),
                                ),
                                child: Text(
                                  'CONCEPT ${currentCard + 1}',
                                  style: const TextStyle(
                                    color: neonPink,
                                    fontSize: 10,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),

                              Text(
                                card['judul']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,
                                ),
                              ),

                              const SizedBox(height: 18),

                              Container(
                                width: 48,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: neonCyan,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: neonCyan.withOpacity(0.4),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 22),

                              Flexible(
                                child: SingleChildScrollView(
                                  child: Text(
                                    card['isi']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: softText,
                                      fontSize: 15,
                                      height: 1.8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: currentCard > 0 && !isChanging
                          ? previousCard
                          : null,
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 18,
                      ),
                      label: const Text('Sebelumnya'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: neonCyan,
                        disabledForegroundColor: softText.withOpacity(0.35),
                        side: BorderSide(
                          color: currentCard > 0
                              ? neonCyan.withOpacity(0.7)
                              : softText.withOpacity(0.2),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: isChanging ? null : nextCard,
                      icon: Icon(
                        currentCard == cards.length - 1
                            ? Icons.check_circle_outline_rounded
                            : Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                      label: Text(
                        currentCard == cards.length - 1
                            ? 'Mulai Kuis'
                            : 'Lanjut',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: neonBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shadowColor: neonBlue.withOpacity(0.4),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
