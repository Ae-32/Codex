import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/language_model.dart';
import '../models/topic_model.dart';
import '../models/cheat_sheet_model.dart';

final contentServiceProvider = Provider<ContentService>((ref) => ContentService());

final languagesProvider = FutureProvider<List<LanguageModel>>((ref) async {
  final service = ref.watch(contentServiceProvider);
  return service.loadLanguages();
});

class ContentService {
  Future<List<LanguageModel>> loadLanguages() async {
    try {
      final jsonString = await rootBundle.loadString('assets/cheat_sheets/languages.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<CheatSheetModel?> loadCheatSheet(String languageId) async {
    try {
      final fileString = await rootBundle.loadString('assets/cheat_sheets/$languageId.md');
      
      // Parse frontmatter metadata if present (between --- and ---)
      List<TopicModel> topics = [];
      String markdownContent = fileString;

      if (fileString.startsWith('---')) {
        final parts = fileString.split('---');
        if (parts.length >= 3) {
          final frontmatter = parts[1];
          markdownContent = parts.sublist(2).join('---').trim();

          // Extract topic items manually from frontmatter
          final topicMatches = RegExp(r'id:\s*([^\n]+)\s*\n\s*title:\s*([^\n]+)\s*\n\s*difficulty:\s*([^\n]+)')
              .allMatches(frontmatter);

          for (final m in topicMatches) {
            topics.add(TopicModel(
              id: m.group(1)?.trim() ?? '',
              title: m.group(2)?.trim() ?? '',
              difficulty: m.group(3)?.trim() ?? 'Beginner',
            ));
          }
        }
      }

      return CheatSheetModel(
        languageId: languageId,
        topics: topics,
        rawMarkdown: markdownContent,
      );
    } catch (e) {
      return null;
    }
  }
}
