import 'package:flutter_test/flutter_test.dart';
import 'package:codex/core/services/content_service.dart';
import 'package:codex/core/models/language_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ContentService Unit Tests', () {
    late ContentService service;

    setUp(() {
      service = ContentService();
    });

    test('loadLanguages loads assets successfully', () async {
      final languages = await service.loadLanguages();
      expect(languages, isA<List<LanguageModel>>());
      expect(languages.isNotEmpty, true);
      
      final python = languages.firstWhere((l) => l.id == 'python');
      expect(python.name, equals('Python'));
      expect(python.category, equals('General Purpose / Scripting'));
    });

    test('loadCheatSheet loads and parses frontmatter correctly', () async {
      final cheatSheet = await service.loadCheatSheet('python');
      expect(cheatSheet, isNotNull);
      expect(cheatSheet!.languageId, equals('python'));
      expect(cheatSheet.topics.isNotEmpty, true);
      expect(cheatSheet.rawMarkdown.isNotEmpty, true);

      final firstTopic = cheatSheet.topics.first;
      expect(firstTopic.id, equals('syntax'));
      expect(firstTopic.title, equals('Variables & Basic Syntax'));
    });

    test('loadCheatSheet parses all bundled language assets', () async {
      final languages = ['python', 'javascript', 'rust', 'sql', 'dart'];
      for (final id in languages) {
        final sheet = await service.loadCheatSheet(id);
        expect(sheet, isNotNull, reason: 'Failed for language $id');
        expect(sheet!.topics.isNotEmpty, true, reason: 'No topics for language $id');
      }
    });
  });
}
