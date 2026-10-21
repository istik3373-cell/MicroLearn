
import 'package:flutter/material.dart';

const Color profilBg = Color(0xFF090B20);
const Color profilCard = Color(0xFF141832);
const Color profilBlue = Color(0xFF4263FF);
const Color profilPink = Color(0xFFFF4FA3);
const Color profilCyan = Color(0xFF46E8FF);

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nama = 'Pengguna MikroLearn';
  String kelas = 'Siswa';
  bool notifikasi = true;

  void editProfil() {
    final namaController = TextEditingController(text: nama);
    final kelasController = TextEditingController(text: kelas);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: profilCard,
        title: const Text(
          'Edit Profil',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: namaController,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration('Nama pengguna'),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: kelasController,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration('Kelas'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Batal',
              style: TextStyle(color: Colors.white60),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: profilPink,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (namaController.text.trim().isNotEmpty) {
                  nama = namaController.text.trim();
                }
                if (kelasController.text.trim().isNotEmpty) {
                  kelas = kelasController.text.trim();
                }
              });
              Navigator.pop(dialogContext);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: profilCyan),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: profilPink),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profilBg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 22, 22, 8),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: profilBlue.withValues(alpha: 0.16),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.person_outline_rounded,
                            color: profilCyan,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MY PROFILE',
                                style: TextStyle(
                                  color: profilCyan,
                                  fontSize: 11,
                                  letterSpacing: 2.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Profil Saya',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          tooltip: 'Edit profil',
                          onPressed: editProfil,
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: profilPink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Kartu identitas pengguna
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF20265A),
                            Color(0xFF171A38),
                            Color(0xFF321A48),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: profilBlue.withValues(alpha: 0.65),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: profilBlue.withValues(alpha: 0.12),
                            blurRadius: 24,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 94,
                            height: 94,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [profilPink, profilBlue, profilCyan],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: profilPink.withValues(alpha: 0.25),
                                  blurRadius: 22,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              size: 56,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            nama,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            kelas,
                            style: const TextStyle(
                              color: profilCyan,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: profilPink.withValues(alpha: 0.13),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: profilPink.withValues(alpha: 0.5),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.auto_awesome_rounded,
                                  color: profilPink,
                                  size: 16,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'MikroLearn Student',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: editProfil,
                              icon: const Icon(Icons.edit_outlined, size: 18),
                              label: const Text('Edit Informasi Profil'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: profilPink),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 13,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Statistik belajar
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 22, 14),
                    child: Text(
                      'Ringkasan Belajar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 125,
                    ),
                    delegate: SliverChildListDelegate([
                      const _StatCard(
                        icon: Icons.menu_book_rounded,
                        title: 'Materi',
                        value: '5',
                        subtitle: 'Topik tersedia',
                        color: profilBlue,
                      ),
                      const _StatCard(
                        icon: Icons.quiz_rounded,
                        title: 'Mini Quiz',
                        value: '5',
                        subtitle: 'Soal per sesi',
                        color: profilPink,
                      ),
                      const _StatCard(
                        icon: Icons.trending_up_rounded,
                        title: 'Progress',
                        value: '0%',
                        subtitle: 'Belajar dimulai',
                        color: profilCyan,
                      ),
                    ]),
                  ),
                ),

                // Pengaturan
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(22, 25, 22, 12),
                    child: Text(
                      'Pengaturan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 22, 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: profilCard,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        children: [
                          SwitchListTile(
                            value: notifikasi,
                            onChanged: (value) {
                              setState(() => notifikasi = value);
                            },
                            activeThumbColor: profilCyan,
                            secondary: const Icon(
                              Icons.notifications_active_outlined,
                              color: profilCyan,
                            ),
                            title: const Text(
                              'Notifikasi',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              'Atur preferensi notifikasi',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Divider(color: Colors.white10, height: 1),
                          ListTile(
                            leading: const Icon(
                              Icons.info_outline_rounded,
                              color: profilPink,
                            ),
                            title: const Text(
                              'Tentang MikroLearn',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              'Media belajar komputer dan perangkatnya',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                            onTap: () {
                              showAboutDialog(
                                context: context,
                                applicationName: 'MikroLearn',
                                applicationVersion: '1.0.0',
                                applicationLegalese:
                                    'Media pembelajaran microlearning.',
                              );
                            },
                          ),
                        ],
                      ),
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
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: profilCard,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 19),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
