import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bookmark_model.dart';

const String _bookmarksKey = 'codex_bookmarks_list';

class BookmarksNotifier extends AsyncNotifier<List<BookmarkModel>> {
  @override
  Future<List<BookmarkModel>> build() async {
    return _loadBookmarks();
  }

  Future<List<BookmarkModel>> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_bookmarksKey);
    if (jsonList == null) return [];

    return jsonList.map((e) => BookmarkModel.fromJson(jsonDecode(e))).toList();
  }

  Future<void> toggleBookmark(BookmarkModel bookmark) async {
    final currentList = state.value ?? [];
    final exists = currentList.any(
        (b) => b.languageId == bookmark.languageId && b.topicId == bookmark.topicId);

    List<BookmarkModel> updatedList;
    if (exists) {
      updatedList = currentList
          .where((b) =>
              !(b.languageId == bookmark.languageId && b.topicId == bookmark.topicId))
          .toList();
    } else {
      updatedList = [bookmark, ...currentList];
    }

    state = AsyncData(updatedList);
    await _saveToPrefs(updatedList);
  }

  bool isBookmarked(String languageId, String topicId) {
    return state.value?.any(
          (b) => b.languageId == languageId && b.topicId == topicId,
        ) ??
        false;
  }

  Future<void> _saveToPrefs(List<BookmarkModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = list.map((b) => jsonEncode(b.toJson())).toList();
    await prefs.setStringList(_bookmarksKey, jsonList);
  }
}

final bookmarksProvider =
    AsyncNotifierProvider<BookmarksNotifier, List<BookmarkModel>>(
        BookmarksNotifier.new);
