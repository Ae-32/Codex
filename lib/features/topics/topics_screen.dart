import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/models/language_model.dart';
import '../../core/models/cheat_sheet_model.dart';
import '../../core/models/bookmark_model.dart';
import '../../core/services/content_service.dart';
import '../../core/services/bookmark_service.dart';
import '../cheat_sheets/cheat_sheet_detail_screen.dart';

final cheatSheetProvider = FutureProvider.family<CheatSheetModel?, String>((ref, languageId) async {
  final service = ref.watch(contentServiceProvider);
  return service.loadCheatSheet(languageId);
});

class TopicsScreen extends ConsumerWidget {
  final LanguageModel language;

  const TopicsScreen({super.key, required this.language});

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return const Color(0xFF4ADE80);
      case 'intermediate':
        return const Color(0xFFFACC15);
      case 'advanced':
        return const Color(0xFFF87171);
      default:
        return const Color(0xFF38BDF8);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cheatSheetAsync = ref.watch(cheatSheetProvider(language.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(language.name),
        actions: [
          TextButton.icon(
            onPressed: () {
              cheatSheetAsync.whenData((sheet) {
                if (sheet != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheatSheetDetailScreen(
                        language: language,
                        cheatSheet: sheet,
                      ),
                    ),
                  );
                }
              });
            },
            icon: const Icon(Icons.menu_book_rounded, size: 18, color: Color(0xFF38BDF8)),
            label: Text(
              'Full Sheet',
              style: GoogleFonts.inter(color: const Color(0xFF38BDF8), fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF334155), width: 0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language.name,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFF8FAFC),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      language.description,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Topics & Modules',
                style: GoogleFonts.inter(
                  color: const Color(0xFFF8FAFC),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: cheatSheetAsync.when(
                  data: (sheet) {
                    if (sheet == null || sheet.topics.isEmpty) {
                      return Center(
                        child: Text(
                          'No topics found for ${language.name}',
                          style: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
                        ),
                      );
                    }

                    final bookmarksList = ref.watch(bookmarksProvider).value ?? [];

                    return ListView.separated(
                      itemCount: sheet.topics.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final topic = sheet.topics[index];
                        final diffColor = _getDifficultyColor(topic.difficulty);
                        final isSaved = bookmarksList.any(
                          (b) => b.languageId == language.id && b.topicId == topic.id,
                        );

                        return Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            title: Text(
                              topic.title,
                              style: GoogleFonts.inter(
                                color: const Color(0xFFF8FAFC),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: diffColor.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: diffColor.withValues(alpha: 0.3)),
                                  ),
                                  child: Text(
                                    topic.difficulty,
                                    style: GoogleFonts.inter(
                                      color: diffColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                IconButton(
                                  icon: Icon(
                                    isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                                    color: isSaved ? const Color(0xFF38BDF8) : const Color(0xFF64748B),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    final bm = BookmarkModel(
                                      languageId: language.id,
                                      languageName: language.name,
                                      topicId: topic.id,
                                      topicTitle: topic.title,
                                      difficulty: topic.difficulty,
                                      savedAt: DateTime.now(),
                                    );
                                    ref.read(bookmarksProvider.notifier).toggleBookmark(bm);
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CheatSheetDetailScreen(
                                    language: language,
                                    cheatSheet: sheet,
                                    initialTopicId: topic.id,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(
                    child: Text('Failed to load topics', style: GoogleFonts.inter(color: Colors.redAccent)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
