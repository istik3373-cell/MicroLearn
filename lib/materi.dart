import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Materi Pembelajaran',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: false,

        iconTheme: const IconThemeData(
          color: Color(0xFF1F2937),
        ),
      ),

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // =========================
            // INTRO
            // =========================
            const Text(
              'Yuk, pilih materi yang ingin kamu pelajari.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // SEARCH
            // =========================
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari materi...',

                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF4F46E5),
                ),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // TITLE
            // =========================
            const Text(
              'Kategori Materi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // MATERI 1
            // =========================
            materialCard(
              context: context,
              icon: Icons.computer,
              title: 'Pengenalan Komputer',
              description:
                  'Mempelajari pengertian, fungsi, dan kegunaan komputer.',
              totalCard: '5 kartu',
              color: const Color(0xFF4F46E5),
            ),

            const SizedBox(height: 15),

            // =========================
            // MATERI 2
            // =========================
            materialCard(
              context: context,
              icon: Icons.keyboard,
              title: 'Perangkat Keras',
              description:
                  'Mengenal berbagai perangkat keras dan fungsi penggunaannya.',
              totalCard: '7 kartu',
              color: const Color(0xFF0891B2),
            ),

            const SizedBox(height: 15),

            // =========================
            // MATERI 3
            // =========================
            materialCard(
              context: context,
              icon: Icons.memory,
              title: 'Komponen Internal',
              description:
                  'Mengenal processor, RAM, motherboard, GPU, SSD/HDD, dan power supply.',
              totalCard: '6 kartu',
              color: const Color(0xFF7C3AED),
            ),

            const SizedBox(height: 15),

            // =========================
            // MATERI 4
            // =========================
            materialCard(
              context: context,
              icon: Icons.apps,
              title: 'Perangkat Lunak',
              description:
                  'Mempelajari sistem operasi, aplikasi, dan software utilitas.',
              totalCard: '5 kartu',
              color: const Color(0xFFDB2777),
            ),

            const SizedBox(height: 15),

            // =========================
            // MATERI 5
            // =========================
            materialCard(
              context: context,
              icon: Icons.settings,
              title: 'Fungsi dan Kegunaan Perangkat',
              description:
                  'Memahami hubungan perangkat komputer dengan fungsi dan penggunaannya.',
              totalCard: '5 kartu',
              color: const Color(0xFFEA580C),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // MATERIAL CARD
  // =====================================================

  Widget materialCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required String totalCard,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Materi $title akan dibuka.',
            ),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(17),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          children: [

            // =========================
            // ICON
            // =========================
            Container(
              width: 58,
              height: 58,

              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Icon(
                icon,
                color: color,
                size: 29,
              ),
            ),

            const SizedBox(width: 15),

            // =========================
            // TEXT
            // =========================
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    totalCard,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // ARROW
            // =========================
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}