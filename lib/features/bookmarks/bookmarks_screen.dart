import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/models/bookmark_model.dart';
import '../../core/services/bookmark_service.dart';
import '../../core/services/content_service.dart';
import '../cheat_sheets/cheat_sheet_detail_screen.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

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
    final bookmarksAsync = ref.watch(bookmarksProvider);
    final languagesAsync = ref.watch(languagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Bookmarks'),
      ),
      body: SafeArea(
        child: bookmarksAsync.when(
          data: (bookmarks) {
            if (bookmarks.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E293B),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.bookmark_border_rounded,
                        size: 48,
                        color: Color(0xFF38BDF8),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No Bookmarks Saved Yet',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFF8FAFC),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Tap the bookmark icon on any topic to save it for quick offline reference.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF94A3B8),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: bookmarks.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = bookmarks[index];
                final diffColor = _getDifficultyColor(item.difficulty);

                return Card(
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(
                      item.topicTitle,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFF8FAFC),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        item.languageName,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF38BDF8),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: diffColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: diffColor.withValues(alpha: 0.3)),
                          ),
                          child: Text(
                            item.difficulty,
                            style: GoogleFonts.inter(
                              color: diffColor,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.bookmark_remove_rounded,
                              color: Color(0xFFF87171), size: 20),
                          onPressed: () {
                            ref
                                .read(bookmarksProvider.notifier)
                                .toggleBookmark(item);
                          },
                        ),
                      ],
                    ),
                    onTap: () async {
                      final langs = languagesAsync.value;
                      if (langs == null) return;
                      final lang = langs.firstWhere(
                        (l) => l.id == item.languageId,
                        orElse: () => langs.first,
                      );
                      final service = ref.read(contentServiceProvider);
                      final sheet = await service.loadCheatSheet(lang.id);

                      if (sheet != null && context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CheatSheetDetailScreen(
                              language: lang,
                              cheatSheet: sheet,
                              initialTopicId: item.topicId,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(
            child: Text('Failed to load bookmarks',
                style: GoogleFonts.inter(color: Colors.redAccent)),
          ),
        ),
      ),
    );
  }
}
