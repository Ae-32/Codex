import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:codex/core/models/bookmark_model.dart';
import 'package:codex/core/services/bookmark_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('BookmarksNotifier saves and removes bookmarks', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // Initial state
    final initialList = await container.read(bookmarksProvider.future);
    expect(initialList, isEmpty);

    final bookmark = BookmarkModel(
      languageId: 'python',
      languageName: 'Python',
      topicId: 'syntax',
      topicTitle: 'Variables & Basic Syntax',
      difficulty: 'Beginner',
      savedAt: DateTime.now(),
    );

    // Add bookmark
    await container.read(bookmarksProvider.notifier).toggleBookmark(bookmark);
    final updatedList = container.read(bookmarksProvider).value;
    expect(updatedList?.length, equals(1));
    expect(updatedList?.first.topicId, equals('syntax'));

    // Remove bookmark
    await container.read(bookmarksProvider.notifier).toggleBookmark(bookmark);
    final emptyList = container.read(bookmarksProvider).value;
    expect(emptyList, isEmpty);
  });
}
