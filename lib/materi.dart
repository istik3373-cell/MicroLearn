import 'package:flutter/material.dart';
import 'quiz.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  String searchQuery = '';

  // Progress tiap materi
  final Map<String, double> progress = {
    'Pengenalan Komputer': 0.6,
    'Perangkat Keras': 0.0,
    'Komponen Internal': 0.0,
    'Perangkat Lunak': 0.0,
    'Fungsi dan Kegunaan Perangkat': 0.0,
  };

  // Bookmark
  final Set<String> bookmarks = {};

  final List<Map<String, dynamic>> materials = [
    {
      'title': 'Pengenalan Komputer',
      'description':
          'Mengenal pengertian, fungsi, dan kegunaan komputer.',
      'icon': Icons.computer_rounded,
      'color': Color(0xFF6257E8),
      'cards': 5,
    },
    {
      'title': 'Perangkat Keras',
      'description':
          'Mengenal berbagai perangkat keras berdasarkan fungsi dan kegunaannya.',
      'icon': Icons.keyboard_rounded,
      'color': Color(0xFF08A6C7),
      'cards': 7,
    },
    {
      'title': 'Komponen Internal',
      'description':
          'Mengenal processor, RAM, motherboard, GPU/VGA, SSD/HDD, dan power supply.',
      'icon': Icons.memory_rounded,
      'color': Color(0xFF9B5DE5),
      'cards': 6,
    },
    {
      'title': 'Perangkat Lunak',
      'description':
          'Mengenal software, sistem operasi, aplikasi, dan software utilitas.',
      'icon': Icons.apps_rounded,
      'color': Color(0xFFE94F9A),
      'cards': 5,
    },
    {
      'title': 'Fungsi dan Kegunaan Perangkat',
      'description':
          'Memahami hubungan perangkat komputer dengan fungsi dan penggunaannya.',
      'icon': Icons.settings_rounded,
      'color': Color(0xFFFF8A34),
      'cards': 5,
    },
  ];


  @override
  Widget build(BuildContext context) {
    final filteredMaterials = materials.where((material) {
      final title = material['title'].toString().toLowerCase();

      return title.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FF),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 650,
            ),

            child: Column(
              children: [

                // =====================================================
                // HEADER
                // =====================================================

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    18,
                    20,
                    10,
                  ),

                  child: Row(
                    children: [

                      Container(
                        width: 45,
                        height: 45,

                        decoration: BoxDecoration(
                          color: const Color(0xFFEAE8FF),
                          borderRadius:
                              BorderRadius.circular(15),
                        ),

                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: Color(0xFF6257E8),
                          size: 24,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Text(
                              'Materi Pembelajaran',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF20243A),
                              ),
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Belajar sedikit demi sedikit ✨',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF85899D),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // BOOKMARK
                      Container(
                        width: 42,
                        height: 42,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(14),
                        ),

                        child: IconButton(
                          onPressed: () {
                            _showBookmarkInfo();
                          },

                          icon: const Icon(
                            Icons.bookmark_rounded,
                            color: Color(0xFF6257E8),
                            size: 21,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // =====================================================
                // BODY SCROLL
                // =====================================================

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      10,
                      20,
                      30,
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        // =================================================
                        // OVERALL PROGRESS
                        // =================================================

                        _buildOverallProgress(),

                        const SizedBox(height: 22),

                        // =================================================
                        // SEARCH
                        // =================================================

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(17),

                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.black.withOpacity(0.04),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),

                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },

                            decoration: InputDecoration(
                              hintText: 'Cari materi...',
                              hintStyle: const TextStyle(
                                color: Color(0xFFB0B3C2),
                                fontSize: 13,
                              ),

                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: Color(0xFF6257E8),
                              ),

                              suffixIcon:
                                  searchQuery.isNotEmpty
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              searchQuery = '';
                                            });
                                          },

                                          icon: const Icon(
                                            Icons.close_rounded,
                                            size: 19,
                                          ),
                                        )
                                      : null,

                              border: InputBorder.none,

                              contentPadding:
                                  const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // =================================================
                        // SECTION TITLE
                        // =================================================

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                          children: [

                            const Text(
                              'Pilih Materi 📚',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF20243A),
                              ),
                            ),

                            Text(
                              '${filteredMaterials.length} topik',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF85899D),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          'Pelajari materi melalui kartu-kartu singkat.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF85899D),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // =================================================
                        // MATERIAL CARDS
                        // =================================================

                        if (filteredMaterials.isEmpty)
                          _buildEmptySearch()
                        else
                          ...filteredMaterials.map(
                            (material) => Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 14),

                              child: _buildMaterialCard(
                                context,
                                material,
                              ),
                            ),
                          ),

                        const SizedBox(height: 10),

                        // =================================================
                        // BOOKMARK INFO
                        // =================================================

                        _buildBookmarkCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // OVERALL PROGRESS
  // ===============================================================

  Widget _buildOverallProgress() {
    double totalProgress = 0;

    for (final value in progress.values) {
      totalProgress += value;
    }

    final average = totalProgress / progress.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            Color(0xFF6257E8),
            Color(0xFF9389F5),
          ],
        ),

        borderRadius: BorderRadius.circular(23),

        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6257E8)
                .withOpacity(0.22),

            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Progress Belajarmu 🚀',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Tetap semangat sampai selesai!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius:
                      BorderRadius.circular(14),
                ),

                child: Text(
                  '${(average * 100).round()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 17),

          ClipRRect(
            borderRadius:
                BorderRadius.circular(10),

            child: LinearProgressIndicator(
              value: average,
              minHeight: 9,

              backgroundColor:
                  Colors.white.withOpacity(0.2),

              valueColor:
                  const AlwaysStoppedAnimation(
                Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            '${_completedCards()} dari ${_totalCards()} kartu telah dipelajari',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // MATERIAL CARD
  // ===============================================================

  Widget _buildMaterialCard(
    BuildContext context,
    Map<String, dynamic> material,
  ) {
    final String title = material['title'];
    final String description = material['description'];
    final IconData icon = material['icon'];
    final Color color = material['color'];
    final int totalCards = material['cards'];

    final double currentProgress =
        progress[title] ?? 0;

    final int completed =
        (currentProgress * totalCards).round();

    final bool isBookmarked =
        bookmarks.contains(title);

    return InkWell(
      borderRadius: BorderRadius.circular(22),

      onTap: () {
        _openMaterial(material);
      },

      child: Container(
        padding: const EdgeInsets.all(17),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.045),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          children: [

            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                // ICON
                Container(
                  width: 58,
                  height: 58,

                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius:
                        BorderRadius.circular(17),
                  ),

                  child: Icon(
                    icon,
                    color: color,
                    size: 29,
                  ),
                ),

                const SizedBox(width: 14),

                // TITLE + DESCRIPTION
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Row(
                        children: [

                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Color(0xFF20243A),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isBookmarked) {
                                  bookmarks.remove(title);
                                } else {
                                  bookmarks.add(title);
                                }
                              });
                            },

                            child: Icon(
                              isBookmarked
                                  ? Icons.bookmark_rounded
                                  : Icons.bookmark_border_rounded,

                              color: isBookmarked
                                  ? color
                                  : const Color(
                                      0xFFB5B7C5,
                                    ),

                              size: 21,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Text(
                        description,
                        maxLines: 2,
                        overflow:
                            TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 11,
                          height: 1.45,
                          color: Color(0xFF85899D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // PROGRESS
            Row(
              children: [

                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10),

                    child: LinearProgressIndicator(
                      value: currentProgress,
                      minHeight: 7,

                      backgroundColor:
                          const Color(0xFFEDEEF5),

                      valueColor:
                          AlwaysStoppedAnimation<Color>(
                        color,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  '$completed/$totalCards',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),

            // BOTTOM
            Row(
              children: [

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    color: color.withOpacity(0.09),
                    borderRadius:
                        BorderRadius.circular(9),
                  ),

                  child: Text(
                    '$totalCards kartu',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),

                const Spacer(),

                Text(
                  currentProgress >= 1
                      ? 'Selesai'
                      : currentProgress > 0
                          ? 'Lanjutkan'
                          : 'Mulai belajar',

                  style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 5),

                Icon(
                  Icons.arrow_forward_rounded,
                  color: color,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ===============================================================
  // OPEN MATERIAL
  // ===============================================================

  Future<void> _openMaterial(
    Map<String, dynamic> material,
  ) async {
    final String title = material['title'];
    final Color color = material['color'];

    final bool? finished = await Navigator.push<bool>(
      context,

      MaterialPageRoute(
        builder: (context) => MaterialCardsPage(
          title: title,
          color: color,
          totalCards: material['cards'],
        ),
      ),
    );

    if (finished == true) {
      setState(() {
        progress[title] = 1.0;
      });

      _showCompletedMessage(title);
    }
  }

  // ===============================================================
  // BOOKMARK CARD
  // ===============================================================

  Widget _buildBookmarkCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: const Color(0xFFEDEBFF),
        borderRadius:
            BorderRadius.circular(19),
      ),

      child: Row(
        children: [

          Container(
            width: 43,
            height: 43,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(13),
            ),

            child: const Icon(
              Icons.bookmark_rounded,
              color: Color(0xFF6257E8),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const Text(
                  'Materi tersimpan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF20243A),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  bookmarks.isEmpty
                      ? 'Belum ada materi yang disimpan.'
                      : '${bookmarks.length} materi disimpan.',

                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF85899D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // EMPTY SEARCH
  // ===============================================================

  Widget _buildEmptySearch() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),

      child: Column(
        children: [

          const Icon(
            Icons.search_off_rounded,
            size: 50,
            color: Color(0xFFB5B7C5),
          ),

          const SizedBox(height: 10),

          const Text(
            'Materi tidak ditemukan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF20243A),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'Coba cari dengan kata kunci lain.',
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF85899D),
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // BOOKMARK INFO
  // ===============================================================

  void _showBookmarkInfo() {
    showModalBottomSheet(
      context: context,

      backgroundColor: Colors.white,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),

      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(22),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const Text(
                '🔖 Materi Tersimpan',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              if (bookmarks.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 25,
                  ),

                  child: Text(
                    'Belum ada materi yang disimpan.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                ...bookmarks.map(
                  (item) => ListTile(
                    leading: const Icon(
                      Icons.bookmark_rounded,
                      color: Color(0xFF6257E8),
                    ),

                    title: Text(item),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // ===============================================================
  // COMPLETED MESSAGE
  // ===============================================================

  void _showCompletedMessage(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,

        backgroundColor:
            const Color(0xFF6257E8),

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(13),
        ),

        content: Text(
          '🎉 Materi "$title" selesai!',
        ),
      ),
    );
  }

  // ===============================================================
  // TOTAL CARDS
  // ===============================================================

  int _totalCards() {
    int total = 0;

    for (final material in materials) {
      total += material['cards'] as int;
    }

    return total;
  }

  // ===============================================================
  // COMPLETED CARDS
  // ===============================================================

  int _completedCards() {
    int total = 0;

    for (final material in materials) {
      final title = material['title'];
      final cards = material['cards'] as int;
      final value = progress[title] ?? 0;

      total += (cards * value).round();
    }

    return total;
  }
}


// ===================================================================
// HALAMAN KARTU PEMBELAJARAN
// ===================================================================

class MaterialCardsPage extends StatefulWidget {
  final String title;
  final Color color;
  final int totalCards;

  const MaterialCardsPage({
    super.key,
    required this.title,
    required this.color,
    required this.totalCards,
  });

  @override
  State<MaterialCardsPage> createState() =>
      _MaterialCardsPageState();
}

class _MaterialCardsPageState
    extends State<MaterialCardsPage> {

  int currentCard = 0;

  late List<Map<String, String>> cards;

  @override
  void initState() {
    super.initState();

    cards = _createCards();
  }

  // ===============================================================
  // DATA KARTU
  // ===============================================================

  List<Map<String, String>> _createCards() {

    switch (widget.title) {

      case 'Pengenalan Komputer':
        return [
          {
            'title': 'Apa itu Komputer?',
            'text':
                'Pelajari pengertian dasar komputer sebagai bagian awal untuk memahami materi komputer.',
          },
          {
            'title': 'Fungsi Komputer',
            'text':
                'Kenali fungsi komputer dalam membantu berbagai kegiatan dan proses pembelajaran.',
          },
          {
            'title': 'Kegunaan Komputer',
            'text':
                'Pelajari kegunaan komputer dalam kehidupan sehari-hari maupun kegiatan pendidikan.',
          },
          {
            'title': 'Komputer dalam Pendidikan',
            'text':
                'Pahami bagaimana komputer dapat dimanfaatkan sebagai bagian dari kegiatan pendidikan.',
          },
          {
            'title': 'Rangkuman',
            'text':
                'Komputer dapat dipelajari melalui pengertian, fungsi, dan kegunaannya dalam kehidupan sehari-hari serta pendidikan.',
          },
        ];

      case 'Perangkat Keras':
        return [
          {
            'title': 'Mengenal Hardware',
            'text':
                'Pelajari berbagai perangkat keras komputer berdasarkan fungsi dan kegunaannya.',
          },
          {
            'title': 'Input Device',
            'text':
                'Kenali kelompok perangkat yang digunakan sebagai input, seperti keyboard dan mouse.',
          },
          {
            'title': 'Process Device',
            'text':
                'Pelajari kelompok perangkat yang berkaitan dengan proses dalam sistem komputer.',
          },
          {
            'title': 'Output Device',
            'text':
                'Kenali perangkat output seperti monitor, printer, dan speaker.',
          },
          {
            'title': 'Storage Device',
            'text':
                'Pelajari kelompok perangkat yang digunakan untuk penyimpanan.',
          },
          {
            'title': 'Perangkat Lainnya',
            'text':
                'Kenali contoh perangkat lain seperti webcam dan berbagai perangkat komputer lainnya.',
          },
          {
            'title': 'Rangkuman Hardware',
            'text':
                'Perangkat keras dapat dipelajari berdasarkan jenis, fungsi, dan kegunaannya.',
          },
        ];

      case 'Komponen Internal':
        return [
          {
            'title': 'Processor',
            'text':
                'Kenali processor sebagai salah satu komponen internal komputer yang perlu dipahami.',
          },
          {
            'title': 'RAM',
            'text':
                'Pelajari RAM melalui pengertian, fungsi, dan contoh penggunaannya.',
          },
          {
            'title': 'Motherboard',
            'text':
                'Kenali motherboard sebagai salah satu komponen yang terdapat di dalam komputer.',
          },
          {
            'title': 'GPU / VGA',
            'text':
                'Pelajari GPU atau VGA sebagai bagian dari komponen internal komputer.',
          },
          {
            'title': 'SSD / HDD',
            'text':
                'Kenali SSD dan HDD sebagai bagian dari komponen internal komputer.',
          },
          {
            'title': 'Power Supply',
            'text':
                'Pelajari power supply sebagai salah satu komponen internal komputer.',
          },
        ];

      case 'Perangkat Lunak':
        return [
          {
            'title': 'Apa itu Software?',
            'text':
                'Pelajari pengertian perangkat lunak atau software.',
          },
          {
            'title': 'Sistem Operasi',
            'text':
                'Kenali sistem operasi sebagai salah satu jenis perangkat lunak.',
          },
          {
            'title': 'Aplikasi',
            'text':
                'Pelajari perangkat lunak dalam bentuk aplikasi dan penggunaannya.',
          },
          {
            'title': 'Software Utilitas',
            'text':
                'Kenali software utilitas sebagai salah satu bagian dari materi perangkat lunak.',
          },
          {
            'title': 'Rangkuman Software',
            'text':
                'Perangkat lunak dapat dipelajari melalui pengertian, jenis, contoh, dan fungsi penggunaannya.',
          },
        ];

      default:
        return [
          {
            'title': 'Mengenal Fungsi Perangkat',
            'text':
                'Pelajari hubungan antara perangkat komputer dengan fungsi dan penggunaannya.',
          },
          {
            'title': 'Memahami Kegunaan',
            'text':
                'Siswa tidak hanya mengenal nama perangkat, tetapi juga memahami kegunaannya.',
          },
          {
            'title': 'Hubungan Perangkat',
            'text':
                'Pahami bagaimana perangkat komputer berkaitan dengan fungsi dan penggunaannya.',
          },
          {
            'title': 'Menggunakan Perangkat',
            'text':
                'Pelajari fungsi dan kegunaan perangkat dalam menjalankan komputer.',
          },
          {
            'title': 'Rangkuman',
            'text':
                'Pemahaman perangkat tidak hanya berdasarkan nama, tetapi juga fungsi dan kegunaannya.',
          },
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final card = cards[currentCard];

    final double cardProgress =
        (currentCard + 1) / cards.length;

    final bool lastCard =
        currentCard == cards.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FF),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF20243A),
          ),
        ),

        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFF20243A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          Padding(
            padding:
                const EdgeInsets.only(right: 18),

            child: Center(
              child: Text(
                '${currentCard + 1}/${cards.length}',
                style: TextStyle(
                  color: widget.color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: 650),

            child: Padding(
              padding:
                  const EdgeInsets.all(20),

              child: Column(
                children: [

                  // =================================================
                  // PROGRESS
                  // =================================================

                  Row(
                    children: [

                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10),

                          child:
                              LinearProgressIndicator(
                            value: cardProgress,
                            minHeight: 8,

                            backgroundColor:
                                const Color(0xFFE4E5EF),

                            valueColor:
                                AlwaysStoppedAnimation<
                                    Color>(
                              widget.color,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Text(
                        '${(cardProgress * 100).round()}%',
                        style: TextStyle(
                          color: widget.color,
                          fontSize: 11,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // =================================================
                  // MICRO CARD
                  // =================================================

                  Expanded(
                    child: AnimatedSwitcher(
                      duration:
                          const Duration(
                        milliseconds: 350,
                      ),

                      child: Container(
                        key: ValueKey(currentCard),

                        width: double.infinity,
                        padding:
                            const EdgeInsets.all(28),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(28),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.06),

                              blurRadius: 18,
                              offset:
                                  const Offset(0, 7),
                            ),
                          ],
                        ),

                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [

                            // ICON
                            Container(
                              width: 80,
                              height: 80,

                              decoration:
                                  BoxDecoration(
                                color: widget.color
                                    .withOpacity(0.12),

                                shape: BoxShape.circle,
                              ),

                              child: Icon(
                                Icons.lightbulb_rounded,
                                color: widget.color,
                                size: 42,
                              ),
                            ),

                            const SizedBox(height: 25),

                            Text(
                              'KARTU ${currentCard + 1}',
                              style: TextStyle(
                                color: widget.color,
                                fontSize: 10,
                                fontWeight:
                                    FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              card['title']!,
                              textAlign:
                                  TextAlign.center,

                              style:
                                  const TextStyle(
                                fontSize: 24,
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Color(0xFF20243A),
                              ),
                            ),

                            const SizedBox(height: 18),

                            Text(
                              card['text']!,
                              textAlign:
                                  TextAlign.center,

                              style:
                                  const TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color:
                                    Color(0xFF85899D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =================================================
                  // BUTTON
                  // =================================================

                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      onPressed: () {

                        if (lastCard) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => QuizPage(
        judulMateri: widget.title,
      ),
    ),
  );
} else {
  setState(() {
    currentCard++;
  });
}
                      },

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            widget.color,

                        foregroundColor:
                            Colors.white,

                        elevation: 0,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Text(
                            lastCard
                                ? 'Selesai Belajar 🎉'
                                : 'Saya Paham, Lanjut →',

                            style:
                                const TextStyle(
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    lastCard
                        ? 'Kamu sudah menyelesaikan semua kartu!'
                        : 'Pelajari satu kartu sebelum lanjut ke kartu berikutnya.',

                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF9A9DAD),
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