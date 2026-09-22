import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/models/language_model.dart';
import '../../core/models/cheat_sheet_model.dart';
import '../../core/widgets/code_block_widget.dart';

class CheatSheetDetailScreen extends StatelessWidget {
  final LanguageModel language;
  final CheatSheetModel cheatSheet;
  final String? initialTopicId;

  const CheatSheetDetailScreen({
    super.key,
    required this.language,
    required this.cheatSheet,
    this.initialTopicId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${language.name} Cheat Sheet'),
      ),
      body: SafeArea(
        child: Markdown(
          data: cheatSheet.rawMarkdown,
          selectable: true,
          styleSheet: MarkdownStyleSheet(
            h1: GoogleFonts.inter(color: const Color(0xFFF8FAFC), fontSize: 24, fontWeight: FontWeight.bold),
            h2: GoogleFonts.inter(color: const Color(0xFF38BDF8), fontSize: 18, fontWeight: FontWeight.bold, height: 1.8),
            h3: GoogleFonts.inter(color: const Color(0xFF818CF8), fontSize: 16, fontWeight: FontWeight.w600),
            p: GoogleFonts.inter(color: const Color(0xFFCBD5E1), fontSize: 14, height: 1.5),
            listBullet: GoogleFonts.inter(color: const Color(0xFF38BDF8)),
            horizontalRuleDecoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF1E293B), width: 0.5),
            ),
          ),
          builders: {
            'code': CustomCodeElementBuilder(defaultLanguage: language.id),
          },
        ),
      ),
    );
  }
}

class CustomCodeElementBuilder extends MarkdownElementBuilder {
  final String defaultLanguage;

  CustomCodeElementBuilder({required this.defaultLanguage});

  @override
  Widget? visitElementAfter(element, preferredStyle) {
    var language = defaultLanguage;
    final textContent = element.textContent;

    if (element.attributes['class'] != null) {
      final lg = element.attributes['class'] as String;
      if (lg.startsWith('language-')) {
        language = lg.replaceFirst('language-', '');
      }
    }

    // Inline code vs code block
    if (!textContent.contains('\n')) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          textContent,
          style: GoogleFonts.firaCode(
            color: const Color(0xFF38BDF8),
            fontSize: 12,
          ),
        ),
      );
    }

    return CodeBlockWidget(
      code: textContent,
      language: language,
    );
  }
}
