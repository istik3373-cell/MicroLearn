
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

  // Daftar kartu menyesuaikan judul materi yang dipilih.
  List<Map<String, String>> get cards {
    switch (widget.judul) {
      case 'Pengenalan Komputer':
        return [
          {
            'judul': 'Apa Itu Komputer?',
            'isi':
                'Komputer adalah perangkat elektronik yang menerima data sebagai masukan, mengolahnya berdasarkan instruksi, menyimpan data, lalu menghasilkan informasi. Komputer dapat melakukan berbagai pekerjaan dengan cepat dan akurat apabila diberikan instruksi yang tepat. Contohnya adalah laptop yang digunakan untuk mengerjakan tugas kuliah.',
          },
          {
            'judul': 'Sejarah dan Perkembangan',
            'isi':
                'Komputer mengalami perkembangan dari mesin hitung berukuran besar menjadi perangkat modern yang lebih kecil dan praktis. Perkembangan teknologi membuat komputer semakin cepat, hemat energi, dan mudah digunakan. Saat ini, komputer hadir dalam berbagai bentuk, seperti komputer desktop, laptop, dan perangkat komputasi lainnya.',
          },
          {
            'judul': 'Cara Kerja Komputer',
            'isi':
                'Komputer bekerja melalui empat tahapan utama, yaitu input, process, output, dan storage. Data dimasukkan melalui perangkat input, kemudian diolah oleh prosesor sesuai instruksi program. Hasil pengolahan ditampilkan melalui perangkat output dan dapat disimpan agar bisa digunakan kembali.',
          },
          {
            'judul': 'Fungsi Komputer',
            'isi':
                'Komputer berfungsi untuk mengolah data, menyimpan informasi, membantu komunikasi, menjalankan aplikasi, dan mendukung pekerjaan manusia. Dalam pendidikan, komputer digunakan untuk membuat tugas dan mengakses materi pembelajaran. Dalam dunia kerja, komputer membantu pengolahan dokumen, perhitungan, desain, dan pengelolaan data.',
          },
          {
            'judul': 'Komputer dalam Kehidupan',
            'isi':
                'Komputer digunakan dalam berbagai bidang kehidupan, seperti pendidikan, kesehatan, bisnis, pemerintahan, dan hiburan. Sekolah memanfaatkannya untuk pembelajaran digital, sedangkan rumah sakit menggunakannya untuk mengelola data pasien. Penggunaan komputer perlu disertai sikap bijak, perlindungan data pribadi, dan kebiasaan menggunakan teknologi secara bertanggung jawab.',
          },
        ];

      case 'Perangkat Keras':
        return [
          {
            'judul': 'Apa Itu Hardware?',
            'isi':
                'Hardware atau perangkat keras adalah bagian fisik komputer yang dapat dilihat dan disentuh. Hardware bekerja sama dengan perangkat lunak agar komputer dapat menjalankan tugasnya. Contohnya adalah monitor, keyboard, mouse, prosesor, RAM, dan printer.',
          },
          {
            'judul': 'Perangkat Input',
            'isi':
                'Perangkat input digunakan untuk memasukkan data atau perintah ke dalam komputer. Keyboard berfungsi memasukkan teks dan angka, sedangkan mouse membantu menggerakkan penunjuk serta memilih menu. Contoh lainnya adalah mikrofon untuk memasukkan suara, scanner untuk memindai dokumen, dan webcam untuk menangkap gambar.',
          },
          {
            'judul': 'Perangkat Output',
            'isi':
                'Perangkat output menyampaikan hasil pengolahan data agar dapat diterima oleh pengguna. Monitor menampilkan informasi secara visual, printer mencetak dokumen ke kertas, dan speaker menghasilkan suara. Pemilihan perangkat output disesuaikan dengan bentuk informasi yang dibutuhkan.',
          },
          {
            'judul': 'Perangkat Penyimpanan',
            'isi':
                'Perangkat penyimpanan digunakan untuk menyimpan data dan program agar dapat diakses kembali. Hard disk drive (HDD) menyimpan data menggunakan piringan magnetik, sedangkan solid-state drive (SSD) menggunakan memori flash dan umumnya memiliki kecepatan akses lebih tinggi. Flashdisk dan kartu memori juga dapat digunakan untuk menyimpan serta memindahkan berkas.',
          },
          {
            'judul': 'Perangkat Pemrosesan',
            'isi':
                'Perangkat pemrosesan menjalankan instruksi dan mengolah data di dalam komputer. CPU atau prosesor mengeksekusi instruksi program dan mengatur berbagai operasi komputer. GPU bertugas memproses grafis dan dapat membantu pekerjaan komputasi tertentu, terutama yang berkaitan dengan gambar, video, dan visualisasi.',
          },
          {
            'judul': 'Perangkat Pendukung',
            'isi':
                'Perangkat pendukung membantu komputer beroperasi dengan baik dan nyaman digunakan. Contohnya adalah kipas atau sistem pendingin untuk mengurangi panas, power supply untuk menyediakan daya listrik, serta UPS untuk memberikan daya sementara ketika listrik terputus. Perangkat jaringan seperti router juga membantu komputer terhubung ke jaringan.',
          },
          {
            'judul': 'Perawatan Hardware',
            'isi':
                'Perangkat keras perlu dirawat agar tetap berfungsi dengan baik dan memiliki masa pakai yang lebih panjang. Bersihkan debu secara berkala, pastikan ventilasi tidak tertutup, dan hindari makanan atau minuman di dekat perangkat. Gunakan komputer sesuai petunjuk, jaga kabel tetap aman, serta matikan perangkat dengan prosedur yang benar.',
          },
        ];

      case 'Komponen Internal':
        return [
          {
            'judul': 'Motherboard',
            'isi':
                'Motherboard adalah papan sirkuit utama yang menjadi tempat terhubungnya berbagai komponen internal komputer. Komponen seperti prosesor, RAM, media penyimpanan, dan kartu ekspansi terhubung melalui soket atau konektor pada motherboard. Motherboard juga membantu komunikasi data di antara komponen tersebut.',
          },
          {
            'judul': 'Processor (CPU)',
            'isi':
                'CPU atau Central Processing Unit menjalankan instruksi program dan melakukan operasi aritmetika maupun logika. Kecepatan kerja CPU dipengaruhi oleh berbagai faktor, termasuk arsitektur, jumlah inti, dan kemampuan pengelolaan daya. CPU bekerja bersama RAM serta komponen lain untuk menjalankan aplikasi dan memproses data.',
          },
          {
            'judul': 'Random Access Memory (RAM)',
            'isi':
                'RAM merupakan memori sementara yang menyimpan data dan instruksi yang sedang digunakan oleh sistem. RAM memungkinkan prosesor mengakses informasi aktif dengan cepat. RAM umumnya bersifat volatil, sehingga data di dalamnya akan hilang ketika daya listrik terputus. Kapasitas RAM yang memadai membantu komputer menjalankan beberapa aplikasi dengan lebih lancar.',
          },
          {
            'judul': 'Penyimpanan Internal',
            'isi':
                'Penyimpanan internal, seperti HDD dan SSD, digunakan untuk menyimpan sistem operasi, aplikasi, serta berkas pengguna dalam jangka panjang. Berbeda dengan RAM, data pada media penyimpanan ini tetap tersimpan meskipun komputer dimatikan. Kapasitas dan kecepatan penyimpanan dapat memengaruhi waktu membuka aplikasi serta memindahkan berkas.',
          },
          {
            'judul': 'Graphics Processing Unit (GPU)',
            'isi':
                'GPU adalah komponen yang dirancang untuk memproses banyak operasi grafis secara paralel. GPU membantu menampilkan gambar, animasi, video, dan tampilan tiga dimensi. GPU dapat terintegrasi dengan prosesor atau hadir sebagai kartu grafis tersendiri. Kebutuhan GPU bergantung pada aktivitas, misalnya pekerjaan kantor, desain grafis, penyuntingan video, atau permainan.',
          },
          {
            'judul': 'Power Supply dan Kerja Komponen',
            'isi':
                'Power Supply Unit (PSU) mengubah listrik dari sumber daya menjadi tegangan yang dibutuhkan komponen komputer. Motherboard menghubungkan komponen, CPU memproses instruksi, RAM menyediakan data sementara, dan SSD atau HDD menyimpan data. Semua komponen tersebut harus kompatibel dan mendapatkan daya yang sesuai agar komputer dapat bekerja dengan stabil.',
          },
        ];

      case 'Perangkat Lunak':
        return [
          {
            'judul': 'Apa Itu Software?',
            'isi':
                'Software atau perangkat lunak adalah kumpulan program dan instruksi yang memberi tahu komputer apa yang harus dilakukan. Software tidak memiliki bentuk fisik seperti hardware, tetapi dapat digunakan melalui perangkat komputer. Contohnya adalah sistem operasi, aplikasi pengolah kata, peramban web, dan aplikasi desain.',
          },
          {
            'judul': 'Sistem Operasi',
            'isi':
                'Sistem operasi adalah perangkat lunak sistem yang mengelola sumber daya komputer dan menjadi penghubung antara hardware, aplikasi, serta pengguna. Sistem operasi mengatur memori, proses, berkas, dan perangkat yang terhubung. Contohnya adalah Microsoft Windows, Linux, macOS, Android, dan iOS.',
          },
          {
            'judul': 'Perangkat Lunak Aplikasi',
            'isi':
                'Perangkat lunak aplikasi dibuat untuk membantu pengguna menyelesaikan tugas tertentu. Aplikasi pengolah kata digunakan untuk membuat dokumen, aplikasi spreadsheet untuk mengolah angka, dan aplikasi presentasi untuk menyampaikan materi. Ada pula aplikasi desain, komunikasi, pembelajaran, dan pengeditan video.',
          },
          {
            'judul': 'Software Utilitas',
            'isi':
                'Software utilitas membantu memelihara, melindungi, dan mengoptimalkan sistem komputer. Contohnya adalah antivirus untuk membantu mendeteksi ancaman, aplikasi pencadangan untuk membuat salinan data, dan alat pengelolaan penyimpanan untuk memeriksa penggunaan ruang. Utilitas perlu dipilih dari sumber tepercaya dan digunakan sesuai kebutuhan.',
          },
          {
            'judul': 'Instalasi dan Keamanan Software',
            'isi':
                'Instal software dari sumber resmi atau tepercaya, periksa persyaratan sistem, dan ikuti petunjuk instalasi. Perbarui aplikasi secara berkala untuk memperoleh perbaikan dan peningkatan keamanan. Hindari program bajakan atau berkas mencurigakan, perhatikan izin aplikasi, dan hapus aplikasi yang tidak lagi diperlukan dengan cara yang benar.',
          },
        ];

      case 'Fungsi dan Kegunaan Perangkat':
        return [
          {
            'judul': 'Input dan Proses Data',
            'isi':
                'Perangkat input memasukkan data ke komputer, sedangkan perangkat pemrosesan mengolah data berdasarkan instruksi. Contohnya, ketika mengetik angka menggunakan keyboard lalu menghitungnya di aplikasi spreadsheet, keyboard berfungsi sebagai input dan CPU menjalankan instruksi penghitungan. Keduanya bekerja bersama untuk menghasilkan informasi.',
          },
          {
            'judul': 'Fungsi Perangkat Output',
            'isi':
                'Perangkat output menyampaikan hasil pengolahan komputer kepada pengguna. Monitor menampilkan hasil perhitungan, printer menghasilkan dokumen cetak, dan speaker mengeluarkan suara. Perangkat yang dipilih bergantung pada hasil yang diperlukan, baik berupa tampilan visual, dokumen fisik, maupun audio.',
          },
          {
            'judul': 'Menyimpan dan Mengelola Data',
            'isi':
                'Perangkat penyimpanan membantu menjaga data agar dapat digunakan kembali setelah proses selesai. SSD atau HDD dapat menyimpan dokumen, foto, video, dan aplikasi. Pengguna perlu mengatur folder dengan rapi, memberi nama berkas yang mudah dikenali, serta membuat cadangan data penting untuk mengurangi risiko kehilangan data.',
          },
          {
            'judul': 'Kerja Sama Hardware dan Software',
            'isi':
                'Hardware dan software saling membutuhkan agar komputer dapat digunakan. Hardware menyediakan komponen fisik untuk menjalankan operasi, sementara software memberikan instruksi yang harus dikerjakan. Sebagai contoh, aplikasi pengolah kata memberikan perintah kepada sistem, CPU memproses instruksi, RAM menyimpan data sementara, dan monitor menampilkan dokumen.',
          },
          {
            'judul': 'Memilih Perangkat yang Tepat',
            'isi':
                'Pemilihan perangkat komputer sebaiknya disesuaikan dengan tujuan penggunaan, kebutuhan spesifikasi, kompatibilitas, dan anggaran. Pekerjaan mengetik dokumen umumnya tidak memerlukan GPU kelas tinggi, sedangkan desain tiga dimensi mungkin membutuhkan kemampuan grafis yang lebih kuat. Pertimbangkan juga kapasitas RAM, penyimpanan, konektivitas, dan kemudahan perawatan.',
          },
        ];

      default:
        return [
          {
            'judul': 'Materi Belum Tersedia',
            'isi':
                'Materi untuk topik ini belum tersedia. Silakan kembali ke daftar materi dan pilih salah satu topik yang sudah disediakan.',
          },
        ];
    }
  }

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
                        disabledForegroundColor:
                            softText.withOpacity(0.35),
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
