
import 'package:flutter/material.dart';
import 'app_storage.dart';
import 'kartu_pembelajaran.dart';

const _bg = Color(0xFF090B20);
const _panel = Color(0xFF151832);
const _blue = Color(0xFF4263FF);
const _pink = Color(0xFFFF4FA3);
const _purple = Color(0xFFAA63FF);
const _cyan = Color(0xFF46E8FF);
const _muted = Color(0xFFA7B0D0);

class ShortcutPage extends StatefulWidget {
  final int initialTab;

  const ShortcutPage({
    super.key,
    this.initialTab = 0,
  });

  @override
  State<ShortcutPage> createState() => _ShortcutPageState();
}

class _ShortcutPageState extends State<ShortcutPage> {
  late int _tab;

  @override
  void initState() {
    super.initState();
    _tab = widget.initialTab;
  }

  void _refresh() {
    setState(() {});
  }

  Future<void> _openTopic(String title) async {
    await AppStorage.addHistory(title);
    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => KartuPembelajaranPage(judul: title),
      ),
    );

    if (mounted) _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        foregroundColor: Colors.white,
        title: const Text(
          'Aktivitas Belajar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                _tabButton('Bookmark', Icons.bookmark_rounded, 0),
                const SizedBox(width: 8),
                _tabButton('Riwayat', Icons.history_rounded, 1),
                const SizedBox(width: 8),
                _tabButton('Progress', Icons.bar_chart_rounded, 2),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _tab,
              children: [
                _buildBookmarks(),
                _buildHistory(),
                _buildProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton(String label, IconData icon, int index) {
    final selected = _tab == index;
    final color = index == 0 ? _purple : index == 1 ? _pink : _cyan;

    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _tab = index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          decoration: BoxDecoration(
            color: selected ? color.withOpacity(0.16) : _panel,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? color : Colors.white12,
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  color: selected ? color : _muted,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookmarks() {
    return FutureBuilder<List<String>>(
      future: AppStorage.getBookmarks(),
      builder: (context, snapshot) {
        final saved = snapshot.data ?? [];

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          children: [
            const Text(
              'Pilih materi yang ingin kamu simpan.',
              style: TextStyle(color: _muted, fontSize: 12),
            ),
            const SizedBox(height: 12),
            ...AppStorage.topics.map((title) {
              final isSaved = saved.contains(title);

              return _itemCard(
                icon: Icons.menu_book_rounded,
                color: _purple,
                title: title,
                subtitle: isSaved ? 'Tersimpan di bookmark' : 'Ketuk ikon untuk menyimpan',
                trailing: IconButton(
                  onPressed: () async {
                    await AppStorage.toggleBookmark(title);
                    _refresh();
                  },
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
                    color: _purple,
                  ),
                ),
                onTap: () => _openTopic(title),
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildHistory() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: AppStorage.getHistory(),
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];

        if (items.isEmpty) {
          return _empty(
            Icons.history_rounded,
            'Belum ada riwayat',
            'Materi dan hasil kuis yang kamu buka akan muncul di sini.',
          );
        }

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () async {
                  await AppStorage.clearHistory();
                  _refresh();
                },
                icon: const Icon(Icons.delete_outline_rounded),
                label: const Text('Hapus riwayat'),
                style: TextButton.styleFrom(foregroundColor: _pink),
              ),
            ),
            ...items.map((item) {
              final title = item['title']?.toString() ?? 'Materi';
              final type = item['type']?.toString() ?? 'Aktivitas';
              final detail = item['detail']?.toString() ?? '';
              final time = DateTime.tryParse(
                item['time']?.toString() ?? '',
              );

              return _itemCard(
                icon: type == 'Kuis'
                    ? Icons.quiz_rounded
                    : Icons.menu_book_rounded,
                color: type == 'Kuis' ? _pink : _blue,
                title: title,
                subtitle: '$type • $detail${time == null ? '' : '\n${_formatTime(time)}'}',
                onTap: () => _openTopic(title),
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildProgress() {
    return FutureBuilder<List<String>>(
      future: AppStorage.getCompleted(),
      builder: (context, snapshot) {
        final completed = snapshot.data ?? [];
        final count = completed.length;
        final percent = count / AppStorage.topics.length;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: _panel,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _cyan.withOpacity(0.45)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PROGRESS PEMBELAJARAN',
                    style: TextStyle(
                      color: _cyan,
                      fontSize: 11,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '$count dari ${AppStorage.topics.length} materi selesai',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: percent,
                      minHeight: 10,
                      backgroundColor: Colors.white12,
                      valueColor: const AlwaysStoppedAnimation(_cyan),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${(percent * 100).round()}% selesai',
                    style: const TextStyle(color: _muted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ...AppStorage.topics.map((title) {
              final done = completed.contains(title);

              return _itemCard(
                icon: done ? Icons.check_circle_rounded : Icons.circle_outlined,
                color: done ? _cyan : _muted,
                title: title,
                subtitle: done
                    ? 'Selesai • nilai kuis minimal 70%'
                    : 'Belum selesai • selesaikan kuis dengan nilai minimal 70%',
                onTap: () => _openTopic(title),
              );
            }),
            const SizedBox(height: 8),
            const Text(
              'Catatan: membuka materi saja belum dihitung selesai.',
              style: TextStyle(color: _muted, fontSize: 11),
            ),
          ],
        );
      },
    );
  }

  Widget _itemCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return Card(
      color: _panel,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: color.withOpacity(0.3)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: _muted, fontSize: 11, height: 1.5),
        ),
        trailing: trailing,
      ),
    );
  }

  Widget _empty(IconData icon, String title, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: _muted, size: 48),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: _muted, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final local = time.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final year = local.year;
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$day/$month/$year • $hour:$minute';
  }
}
