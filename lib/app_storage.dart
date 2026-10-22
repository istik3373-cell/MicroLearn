
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static const _bookmarksKey = 'mikrolearn_bookmarks';
  static const _historyKey = 'mikrolearn_history';
  static const _completedKey = 'mikrolearn_completed';
  static const _scoresKey = 'mikrolearn_scores';

  static const topics = [
    'Pengenalan Komputer',
    'Perangkat Keras',
    'Komponen Internal',
    'Perangkat Lunak',
    'Fungsi dan Kegunaan Perangkat',
  ];

  static Future<List<String>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_bookmarksKey) ?? [];
  }

  static Future<void> toggleBookmark(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(_bookmarksKey) ?? [];

    if (items.contains(title)) {
      items.remove(title);
    } else {
      items.add(title);
    }

    await prefs.setStringList(_bookmarksKey, items);
  }

  static Future<bool> isBookmarked(String title) async {
    final items = await getBookmarks();
    return items.contains(title);
  }

  static Future<void> addHistory(
    String title, {
    String type = 'Materi',
    String detail = 'Dibuka',
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final items = _readHistory(prefs);

    items.insert(0, {
      'title': title,
      'type': type,
      'detail': detail,
      'time': DateTime.now().toIso8601String(),
    });

    // Batasi riwayat supaya penyimpanan tidak terus membesar.
    if (items.length > 100) {
      items.removeRange(100, items.length);
    }

    await prefs.setString(_historyKey, jsonEncode(items));
  }

  static List<Map<String, dynamic>> _readHistory(
    SharedPreferences prefs,
  ) {
    final raw = prefs.getString(_historyKey);
    if (raw == null) return [];

    try {
      return (jsonDecode(raw) as List)
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return _readHistory(prefs);
  }

  static Future<void> recordQuizResult(
    String title,
    int score,
    int total,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final percent = total == 0 ? 0 : (score * 100 / total).round();

    final raw = prefs.getString(_scoresKey);
    List<Map<String, dynamic>> scores = [];

    if (raw != null) {
      try {
        scores = (jsonDecode(raw) as List)
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();
      } catch (_) {}
    }

    scores.insert(0, {
      'title': title,
      'score': score,
      'total': total,
      'percent': percent,
      'time': DateTime.now().toIso8601String(),
    });

    await prefs.setString(_scoresKey, jsonEncode(scores));

    // Materi dinyatakan selesai jika nilai mencapai minimal 70%.
    if (percent >= 70) {
      final completed = prefs.getStringList(_completedKey) ?? [];
      if (!completed.contains(title)) {
        completed.add(title);
        await prefs.setStringList(_completedKey, completed);
      }
    }

    await addHistory(
      title,
      type: 'Kuis',
      detail: '$score/$total benar • $percent%',
    );
  }

  static Future<List<String>> getCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_completedKey) ?? [];
  }

  static Future<List<Map<String, dynamic>>> getScores() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_scoresKey);
    if (raw == null) return [];

    try {
      return (jsonDecode(raw) as List)
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}
