import 'package:flutter/material.dart';
import 'quiz.dart';

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
    extends State<KartuPembelajaranPage> {
  int currentCard = 0;

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

  void nextCard() {
    if (currentCard < cards.length - 1) {
      setState(() {
        currentCard++;
      });
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

  void previousCard() {
    if (currentCard > 0) {
      setState(() {
        currentCard--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final card = cards[currentCard];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judul),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Kartu Pembelajaran',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '${currentCard + 1} dari ${cards.length}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: (currentCard + 1) / cards.length,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.menu_book_rounded,
                        size: 45,
                        color: Colors.indigo.shade600,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Text(
                      card['judul']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      card['isi']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed:
                        currentCard > 0 ? previousCard : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Sebelumnya'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: nextCard,
                    icon: Icon(
                      currentCard == cards.length - 1
                          ? Icons.check
                          : Icons.arrow_forward,
                    ),
                    label: Text(
                      currentCard == cards.length - 1
                          ? 'Selesai'
                          : 'Lanjut',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}