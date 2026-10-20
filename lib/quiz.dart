import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final String judulMateri;

  const QuizPage({
    super.key,
    required this.judulMateri,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Apa yang dimaksud dengan komputer?',
      'options': [
        'Alat untuk memasak',
        'Perangkat elektronik untuk mengolah data',
        'Alat untuk mencetak uang',
        'Perangkat untuk mengisi baterai',
      ],
      'answer': 1,
    },
    {
      'question': 'Data yang telah diolah oleh komputer disebut...',
      'options': [
        'Informasi',
        'Keyboard',
        'Hardware',
        'Folder',
      ],
      'answer': 0,
    },
    {
      'question': 'Manakah yang termasuk perangkat keras?',
      'options': [
        'Microsoft Word',
        'Windows',
        'Keyboard',
        'Google Chrome',
      ],
      'answer': 2,
    },
    {
      'question': 'Bagian komputer yang digunakan untuk menampilkan gambar disebut...',
      'options': [
        'Keyboard',
        'Monitor',
        'Mouse',
        'Speaker',
      ],
      'answer': 1,
    },
    {
      'question': 'Perangkat yang digunakan untuk memasukkan teks ke komputer adalah...',
      'options': [
        'Monitor',
        'Printer',
        'Keyboard',
        'Speaker',
      ],
      'answer': 2,
    },
  ];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == questions[currentQuestion]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultPage(
          score: score,
          total: questions.length,
          judulMateri: widget.judulMateri,
        ),
      ),
    );
  }

  Color getOptionColor(int index) {
    if (!answered) {
      return Colors.white;
    }

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return const Color(0xFFD1FAE5);
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return const Color(0xFFFEE2E2);
    }

    return Colors.white;
  }

  Color getOptionBorderColor(int index) {
    if (!answered) {
      return const Color(0xFFE5E7EB);
    }

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return const Color(0xFF10B981);
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return const Color(0xFFEF4444);
    }

    return const Color(0xFFE5E7EB);
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress = (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Mini Quiz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 650,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Uji Pemahaman 🎯',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${currentQuestion + 1}/${questions.length}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // PROGRESS BAR
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: const Color(0xFFE5E7EB),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF6366F1),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // MATERI LABEL
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE9FE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.judulMateri,
                      style: const TextStyle(
                        color: Color(0xFF6366F1),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // QUESTION CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF6366F1),
                          Color(0xFF8B5CF6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.psychology_rounded,
                          color: Colors.white,
                          size: 42,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          question['question'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Pilih jawaban yang paling tepat:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B5563),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // OPTIONS
                  Expanded(
                    child: ListView.builder(
                      itemCount: question['options'].length,
                      itemBuilder: (context, index) {
                        final option = question['options'][index];

                        return GestureDetector(
                          onTap: () => selectAnswer(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: getOptionColor(index),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: getOptionBorderColor(index),
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: answered &&
                                            index ==
                                                question['answer']
                                        ? const Color(0xFF10B981)
                                        : answered &&
                                                index == selectedAnswer
                                            ? const Color(0xFFEF4444)
                                            : const Color(0xFFEDE9FE),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    String.fromCharCode(65 + index),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: answered &&
                                              (index ==
                                                      question['answer'] ||
                                                  index == selectedAnswer)
                                          ? Colors.white
                                          : const Color(0xFF6366F1),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: Text(
                                    option,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF374151),
                                    ),
                                  ),
                                ),

                                if (answered &&
                                    index == question['answer'])
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF10B981),
                                  ),

                                if (answered &&
                                    index == selectedAnswer &&
                                    index != question['answer'])
                                  const Icon(
                                    Icons.cancel,
                                    color: Color(0xFFEF4444),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // BUTTON
                  if (answered)
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          currentQuestion == questions.length - 1
                              ? 'Lihat Hasil 🎉'
                              : 'Soal Berikutnya →',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

// ======================================================
// HALAMAN HASIL QUIZ
// ======================================================

class QuizResultPage extends StatelessWidget {
  final int score;
  final int total;
  final String judulMateri;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.total,
    required this.judulMateri,
  });

  String getMessage() {
    final percentage = score / total * 100;

    if (percentage == 100) {
      return 'Sempurna! Kamu keren banget! 🏆';
    } else if (percentage >= 80) {
      return 'Hebat! Pemahamanmu sudah bagus! 🎉';
    } else if (percentage >= 60) {
      return 'Bagus! Tinggal sedikit lagi! 💪';
    } else {
      return 'Jangan menyerah! Yuk pelajari lagi materinya! 📚';
    }
  }

  IconData getIcon() {
    final percentage = score / total * 100;

    if (percentage >= 80) {
      return Icons.emoji_events_rounded;
    } else if (percentage >= 60) {
      return Icons.star_rounded;
    } else {
      return Icons.menu_book_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (score / total * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 650,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ICON
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF6366F1),
                          Color(0xFF8B5CF6),
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      getIcon(),
                      color: Colors.white,
                      size: 60,
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Quiz Selesai!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    judulMateri,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // SCORE CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Skor Kamu',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          '$score / $total',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6366F1),
                          ),
                        ),

                        Text(
                          '$percentage%',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF10B981),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          getMessage(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ULANGI
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              judulMateri: judulMateri,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        'Ulangi Quiz',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // KEMBALI
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text(
                        'Kembali ke Materi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6366F1),
                        side: const BorderSide(
                          color: Color(0xFF6366F1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
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