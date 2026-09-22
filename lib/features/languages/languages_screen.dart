import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/services/content_service.dart';
import '../../core/widgets/language_card_widget.dart';
import '../../core/widgets/search_bar_widget.dart';
import '../topics/topics_screen.dart';
import '../bookmarks/bookmarks_screen.dart';

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String query) => state = query;
  void clear() => state = '';
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(SearchQueryNotifier.new);

class LanguagesScreen extends ConsumerWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languagesAsync = ref.watch(languagesProvider);
    final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.code_rounded, color: Color(0xFF38BDF8), size: 20),
            ),
            const SizedBox(width: 10),
            Text('CODEX', style: GoogleFonts.firaCode(letterSpacing: 1.5, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BookmarksScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                'Cheat Sheets',
                style: GoogleFonts.inter(
                  color: const Color(0xFFF8FAFC),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Select a language to browse topics and syntax reference',
                style: GoogleFonts.inter(
                  color: const Color(0xFF94A3B8),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              SearchBarWidget(
                hintText: 'Search programming languages...',
                onChanged: (val) => ref.read(searchQueryProvider.notifier).setQuery(val),
                onClear: searchQuery.isNotEmpty
                    ? () => ref.read(searchQueryProvider.notifier).clear()
                    : null,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: languagesAsync.when(
                  data: (languages) {
                    final filtered = languages.where((l) {
                      return l.name.toLowerCase().contains(searchQuery) ||
                          l.category.toLowerCase().contains(searchQuery);
                    }).toList();

                    if (filtered.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.search_off_rounded, size: 48, color: Color(0xFF94A3B8)),
                            const SizedBox(height: 12),
                            Text(
                              'No languages found',
                              style: GoogleFonts.inter(color: const Color(0xFFF8FAFC), fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }

                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final lang = filtered[index];
                        return LanguageCardWidget(
                          language: lang,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TopicsScreen(language: lang),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(
                    child: Text(
                      'Failed to load languages',
                      style: GoogleFonts.inter(color: Colors.redAccent),
                    ),
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
