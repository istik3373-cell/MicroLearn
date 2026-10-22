import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'app_storage.dart';

const Color quizBg = Color(0xFF090B20);
const Color quizCard = Color(0xFF141832);
const Color quizBlue = Color(0xFF4263FF);
const Color quizPink = Color(0xFFFF4FA3);
const Color quizCyan = Color(0xFF46E8FF);
const Color quizMuted = Color(0xFFA7B0D0);

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

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
    final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playAnswerSound(bool isCorrect) async {
    try {
      await _audioPlayer.stop();

      await _audioPlayer.play(
        AssetSource(
          isCorrect ? 'sounds/correct.wav' : 'sounds/wrong.wav',
        ),
      );
    } catch (e) {
      debugPrint('Gagal memutar suara quiz: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  
  List<QuizQuestion> get questions {
    switch (widget.judulMateri) {
      case 'Pengenalan Komputer':
        return const [
          QuizQuestion(
            question: 'Apa yang dimaksud dengan komputer?',
            options: [
              'Perangkat elektronik untuk mengolah data',
              'Alat khusus untuk mencetak dokumen',
              'Perangkat untuk menyimpan pakaian',
              'Alat yang hanya digunakan untuk bermain',
            ],
            correctIndex: 0,
          ),
          QuizQuestion(
            question: 'Apa tahapan utama cara kerja komputer?',
            options: [
              'Mengetik, mencetak, dan mematikan',
              'Input, process, output, dan storage',
              'Membuka, menutup, dan menghapus',
              'Mengunduh, mengunggah, dan mencetak',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Manakah contoh penggunaan komputer di bidang pendidikan?',
            options: [
              'Mengatur suhu ruangan secara manual',
              'Memasak makanan',
              'Membuat tugas dan mengakses materi belajar',
              'Membersihkan ruang kelas',
            ],
            correctIndex: 2,
          ),
          QuizQuestion(
            question: 'Apa yang dimaksud dengan data dalam proses komputasi?',
            options: [
              'Hanya gambar yang ditampilkan monitor',
              'Hasil cetakan dari printer',
              'Perangkat untuk menyimpan listrik',
              'Bahan yang dapat diolah menjadi informasi',
            ],
            correctIndex: 3,
          ),
          QuizQuestion(
            question: 'Mengapa komputer perlu digunakan secara bijak?',
            options: [
              'Agar keamanan data dan tanggung jawab pengguna tetap terjaga',
              'Agar semua aplikasi berbayar',
              'Agar komputer tidak membutuhkan listrik',
              'Agar perangkat keras tidak diperlukan',
            ],
            correctIndex: 0,
          ),
        ];

      case 'Perangkat Keras':
        return const [
          QuizQuestion(
            question: 'Apa yang dimaksud dengan hardware?',
            options: [
              'Kumpulan instruksi aplikasi',
              'Bagian fisik komputer yang dapat dilihat dan disentuh',
              'Data yang tersimpan di internet',
              'Sistem untuk mengelola akun',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Manakah yang termasuk perangkat input?',
            options: [
              'Monitor',
              'Speaker',
              'Keyboard',
              'Printer',
            ],
            correctIndex: 2,
          ),
          QuizQuestion(
            question: 'Apa fungsi utama monitor?',
            options: [
              'Menyimpan data secara permanen',
              'Memasukkan teks ke komputer',
              'Menyediakan daya listrik',
              'Menampilkan informasi secara visual',
            ],
            correctIndex: 3,
          ),
          QuizQuestion(
            question: 'Perangkat manakah yang umumnya menggunakan memori flash untuk menyimpan data?',
            options: [
              'SSD',
              'Monitor',
              'Keyboard',
              'Speaker',
            ],
            correctIndex: 0,
          ),
          QuizQuestion(
            question: 'Apa tugas utama CPU?',
            options: [
              'Mencetak dokumen',
              'Menjalankan instruksi dan memproses data',
              'Menghasilkan suara',
              'Menampilkan gambar saja',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Apa fungsi kipas atau sistem pendingin komputer?',
            options: [
              'Menambah kapasitas penyimpanan',
              'Memasukkan data',
              'Membantu mengurangi panas komponen',
              'Menggantikan sistem operasi',
            ],
            correctIndex: 2,
          ),
          QuizQuestion(
            question: 'Manakah kebiasaan yang tepat untuk merawat hardware?',
            options: [
              'Menutup seluruh ventilasi komputer',
              'Membiarkan debu menumpuk',
              'Menarik kabel saat perangkat menyala',
              'Membersihkan perangkat dan menjaga ventilasi',
            ],
            correctIndex: 3,
          ),
        ];

      case 'Komponen Internal':
        return const [
          QuizQuestion(
            question: 'Apa fungsi utama motherboard?',
            options: [
              'Menghubungkan berbagai komponen komputer',
              'Mencetak dokumen',
              'Menghasilkan suara',
              'Menampilkan presentasi',
            ],
            correctIndex: 0,
          ),
          QuizQuestion(
            question: 'Apa kepanjangan CPU?',
            options: [
              'Computer Personal Utility',
              'Central Processing Unit',
              'Central Program User',
              'Computer Power Usage',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Apa karakteristik utama RAM?',
            options: [
              'Digunakan khusus untuk mencetak',
              'Menyimpan data selamanya tanpa daya',
              'Menyimpan data sementara saat program berjalan',
              'Berfungsi sebagai layar komputer',
            ],
            correctIndex: 2,
          ),
          QuizQuestion(
            question: 'Apa perbedaan utama RAM dengan SSD?',
            options: [
              'RAM digunakan untuk mencetak dokumen',
              'SSD hanya dapat menampilkan gambar',
              'RAM merupakan perangkat output',
              'RAM menyimpan data sementara, sedangkan SSD menyimpan data jangka panjang',
            ],
            correctIndex: 3,
          ),
          QuizQuestion(
            question: 'Komponen apa yang dirancang untuk menangani pemrosesan grafis?',
            options: [
              'GPU',
              'Keyboard',
              'Power supply',
              'Mouse',
            ],
            correctIndex: 0,
          ),
          QuizQuestion(
            question: 'Apa tugas power supply unit (PSU)?',
            options: [
              'Menyimpan dokumen pengguna',
              'Menyediakan daya listrik yang sesuai untuk komponen',
              'Mengolah teks dalam dokumen',
              'Menghubungkan komputer ke proyektor',
            ],
            correctIndex: 1,
          ),
        ];

      case 'Perangkat Lunak':
        return const [
          QuizQuestion(
            question: 'Apa yang dimaksud dengan software?',
            options: [
              'Komponen fisik komputer',
              'Kabel penghubung perangkat',
              'Program dan instruksi untuk menjalankan tugas',
              'Perangkat untuk mencetak dokumen',
            ],
            correctIndex: 2,
          ),
          QuizQuestion(
            question: 'Manakah yang termasuk sistem operasi?',
            options: [
              'Keyboard',
              'Printer',
              'Mouse',
              'Microsoft Windows',
            ],
            correctIndex: 3,
          ),
          QuizQuestion(
            question: 'Aplikasi spreadsheet umumnya digunakan untuk apa?',
            options: [
              'Mengolah angka dan data dalam lembar kerja',
              'Mendinginkan prosesor',
              'Menyediakan daya listrik',
              'Membersihkan bagian dalam komputer',
            ],
            correctIndex: 0,
          ),
          QuizQuestion(
            question: 'Apa kegunaan software utilitas?',
            options: [
              'Menggantikan semua hardware',
              'Membantu pemeliharaan dan perlindungan sistem',
              'Mengubah monitor menjadi keyboard',
              'Menyediakan listrik untuk komputer',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Apa tindakan yang tepat saat memasang software?',
            options: [
              'Mengunduh semua berkas dari sumber tak dikenal',
              'Mengabaikan seluruh pembaruan keamanan',
              'Memilih sumber tepercaya dan memeriksa persyaratan sistem',
              'Memberikan semua izin tanpa memeriksa',
            ],
            correctIndex: 2,
          ),
        ];

      case 'Fungsi dan Kegunaan Perangkat':
        return const [
          QuizQuestion(
            question: 'Dalam proses mengetik, apa fungsi keyboard?',
            options: [
              'Menampilkan hasil ke layar',
              'Mencetak dokumen',
              'Menyimpan data secara permanen',
              'Memasukkan data dan perintah',
            ],
            correctIndex: 3,
          ),
          QuizQuestion(
            question: 'Perangkat apa yang tepat untuk menghasilkan dokumen di atas kertas?',
            options: [
              'Printer',
              'RAM',
              'CPU',
              'Mouse',
            ],
            correctIndex: 0,
          ),
          QuizQuestion(
            question: 'Mengapa data penting sebaiknya dicadangkan?',
            options: [
              'Agar kapasitas RAM selalu penuh',
              'Untuk mengurangi risiko kehilangan data',
              'Agar monitor lebih terang',
              'Untuk menggantikan sistem operasi',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Bagaimana hardware dan software bekerja sama?',
            options: [
              'Hardware selalu bekerja tanpa instruksi',
              'Software merupakan bagian fisik komputer',
              'Software memberikan instruksi dan hardware menjalankan operasi',
              'Keduanya tidak saling berhubungan',
            ],
            correctIndex: 2,
          ),
          QuizQuestion(
            question: 'Apa yang perlu dipertimbangkan saat memilih komputer?',
            options: [
              'Warna perangkat saja',
              'Jumlah stiker pada perangkat',
              'Merek tanpa mempertimbangkan kebutuhan',
              'Tujuan penggunaan, spesifikasi, kompatibilitas, dan anggaran',
            ],
            correctIndex: 3,
          ),
        ];

      default:
        return const [
          QuizQuestion(
            question: 'Apa fungsi utama komputer?',
            options: [
              'Mengolah data menjadi informasi',
              'Mencetak dokumen saja',
              'Menyimpan pakaian',
              'Menghasilkan listrik',
            ],
            correctIndex: 0,
          ),
          QuizQuestion(
            question: 'Manakah yang termasuk perangkat input?',
            options: [
              'Monitor',
              'Keyboard',
              'Speaker',
              'Printer',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Apa fungsi sistem operasi?',
            options: [
              'Mencetak dokumen',
              'Menggantikan semua komponen',
              'Mengelola sumber daya komputer',
              'Menyimpan listrik',
            ],
            correctIndex: 2,
          ),
          QuizQuestion(
            question: 'Apa fungsi RAM?',
            options: [
              'Menampilkan gambar',
              'Mencetak teks',
              'Menghubungkan komputer ke listrik',
              'Menyimpan data sementara saat program berjalan',
            ],
            correctIndex: 3,
          ),
          QuizQuestion(
            question: 'Apa contoh perangkat output?',
            options: [
              'Monitor',
              'Keyboard',
              'Mouse',
              'Scanner',
            ],
            correctIndex: 0,
          ),
        ];
    }
  }

  void chooseAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
    });
  }

    
  void nextQuestion() {
    if (selectedAnswer == null || answered) return;

    final isCorrect =
        selectedAnswer == questions[currentQuestion].correctIndex;

    _playAnswerSound(isCorrect);

    setState(() {
      answered = true;

      if (isCorrect) {
        score++;
      }
    });

    Future.delayed(const Duration(milliseconds: 650), () async {
      if (!mounted) return;

      if (currentQuestion < questions.length - 1) {
        setState(() {
          currentQuestion++;
          selectedAnswer = null;
          answered = false;
        });
      } else {
        // Simpan hasil setelah semua soal selesai dijawab.
        await AppStorage.recordQuizResult(
          widget.judulMateri,
          score,
          questions.length,
        );

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => QuizResultPage(
              judulMateri: widget.judulMateri,
              score: score,
              total: questions.length,
            ),
          ),
        );
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: quizBg,
      body: Stack(
        children: [
          Positioned(
            top: -90,
            right: -90,
            child: _QuizGlow(
              color: quizPink.withOpacity(0.12),
              size: 240,
            ),
          ),
          Positioned(
            bottom: 80,
            left: -120,
            child: _QuizGlow(
              color: quizBlue.withOpacity(0.12),
              size: 250,
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                      child: Row(
                        children: [
                          _IconButtonBox(
                            icon: Icons.arrow_back_rounded,
                            onTap: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MIKROLEARN / QUIZ',
                                  style: TextStyle(
                                    color: quizCyan,
                                    fontSize: 10,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Knowledge Check',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: quizPink.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: quizPink.withOpacity(0.4),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.bolt_rounded,
                                  color: quizPink,
                                  size: 17,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '$score XP',
                                  style: const TextStyle(
                                    color: quizPink,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Container(
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
                                  color: quizPink.withOpacity(0.35),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'CHALLENGE MODE',
                                          style: TextStyle(
                                            color: quizPink,
                                            fontSize: 10,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          widget.judulMateri,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Uji pemahamanmu dan selesaikan tantangan ini!',
                                          style: TextStyle(
                                            color: quizMuted,
                                            fontSize: 12,
                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.psychology_alt_rounded,
                                    color: quizCyan,
                                    size: 52,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 28),
                            Row(
                              children: [
                                Text(
                                  'QUESTION ${currentQuestion + 1}',
                                  style: const TextStyle(
                                    color: quizCyan,
                                    fontSize: 11,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '${currentQuestion + 1}/${questions.length}',
                                  style: const TextStyle(
                                    color: quizMuted,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                value: (currentQuestion + 1) /
                                    questions.length,
                                minHeight: 6,
                                backgroundColor: Colors.white.withOpacity(0.08),
                                valueColor:
                                    const AlwaysStoppedAnimation(quizPink),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'PILIH JAWABAN YANG TEPAT',
                              style: TextStyle(
                                color: quizMuted,
                                fontSize: 10,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: quizCard,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: quizBlue.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                question.question,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            ...List.generate(
                              question.options.length,
                              (index) {
                                final isSelected = selectedAnswer == index;
                                final isCorrect =
                                    index == question.correctIndex;

                                Color borderColor =
                                    Colors.white.withOpacity(0.09);
                                Color iconColor = quizMuted;
                                IconData icon = Icons.circle_outlined;

                                if (answered && isCorrect) {
                                  borderColor = quizCyan;
                                  iconColor = quizCyan;
                                  icon = Icons.check_circle_rounded;
                                } else if (answered && isSelected) {
                                  borderColor = quizPink;
                                  iconColor = quizPink;
                                  icon = Icons.cancel_rounded;
                                } else if (isSelected) {
                                  borderColor = quizPink;
                                  iconColor = quizPink;
                                  icon = Icons.radio_button_checked_rounded;
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () => chooseAnswer(index),
                                      borderRadius: BorderRadius.circular(16),
                                      child: Ink(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? quizPink.withOpacity(0.08)
                                              : quizCard,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                            color: borderColor,
                                            width: isSelected || answered
                                                ? 1.4
                                                : 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 34,
                                              height: 34,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: iconColor.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                String.fromCharCode(65 + index),
                                                style: TextStyle(
                                                  color: iconColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 13),
                                            Expanded(
                                              child: Text(
                                                question.options[index],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  height: 1.5,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Icon(
                                              icon,
                                              color: iconColor,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (answered) ...[
                              const SizedBox(height: 4),
                              Text(
                                selectedAnswer == question.correctIndex
                                    ? 'Nice! Jawaban kamu benar!'
                                    : 'Belum tepat. Jawaban yang benar sudah ditandai.',
                                style: TextStyle(
                                  color: selectedAnswer ==
                                          question.correctIndex
                                      ? quizCyan
                                      : quizPink,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 54,
                              child: ElevatedButton(
                                onPressed: selectedAnswer == null || answered
                                    ? null
                                    : nextQuestion,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: quizPink,
                                  disabledBackgroundColor:
                                      quizPink.withOpacity(0.2),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      currentQuestion == questions.length - 1
                                          ? 'LIHAT HASIL'
                                          : 'JAWAB & LANJUT',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 19,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
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

class QuizResultPage extends StatelessWidget {
  final String judulMateri;
  final int score;
  final int total;

  const QuizResultPage({
    super.key,
    required this.judulMateri,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = total == 0 ? 0 : (score * 100 / total).round();
    final passed = percentage >= 70;

    return Scaffold(
      backgroundColor: quizBg,
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -80,
            child: _QuizGlow(
              color: quizPink.withOpacity(0.12),
              size: 240,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'MIKROLEARN / RESULTS',
                        style: TextStyle(
                          color: quizCyan,
                          fontSize: 11,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (passed ? quizCyan : quizPink)
                              .withOpacity(0.1),
                          border: Border.all(
                            color: passed ? quizCyan : quizPink,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (passed ? quizCyan : quizPink)
                                  .withOpacity(0.15),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Icon(
                          passed
                              ? Icons.emoji_events_rounded
                              : Icons.psychology_alt_rounded,
                          color: passed ? quizCyan : quizPink,
                          size: 52,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        passed ? 'LEVEL COMPLETED!' : 'KEEP LEARNING!',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        passed
                            ? 'Kerja bagus! Kamu berhasil menyelesaikan quiz.'
                            : 'Terus belajar, kamu pasti bisa lebih baik lagi.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: quizMuted,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: quizCard,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: quizPink.withOpacity(0.35),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'YOUR FINAL SCORE',
                              style: TextStyle(
                                color: quizMuted,
                                fontSize: 11,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '$percentage',
                              style: const TextStyle(
                                color: quizPink,
                                fontSize: 62,
                                height: 1.1,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'POINTS',
                              style: TextStyle(
                                color: quizCyan,
                                fontSize: 11,
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 22),
                            Row(
                              children: [
                                Expanded(
                                  child: _ResultStat(
                                    label: 'BENAR',
                                    value: '$score',
                                    color: quizCyan,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _ResultStat(
                                    label: 'SALAH',
                                    value: '${total - score}',
                                    color: quizPink,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                          },
                          icon: const Icon(Icons.home_rounded),
                          label: const Text('KEMBALI KE BERANDA'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: quizPink,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QuizPage(
                                  judulMateri: judulMateri,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('ULANGI QUIZ'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: quizCyan,
                            side: BorderSide(
                              color: quizCyan.withOpacity(0.5),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
        ],
      ),
    );
  }
}

class _ResultStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ResultStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconButtonBox extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButtonBox({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: quizCard,
      borderRadius: BorderRadius.circular(13),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          child: Icon(icon, color: Colors.white, size: 21),
        ),
      ),
    );
  }
}

class _QuizGlow extends StatelessWidget {
  final Color color;
  final double size;

  const _QuizGlow({
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
              spreadRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
