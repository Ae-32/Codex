import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/language_model.dart';

class LanguageCardWidget extends StatelessWidget {
  final LanguageModel language;
  final VoidCallback onTap;

  const LanguageCardWidget({
    super.key,
    required this.language,
    required this.onTap,
  });

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'javascript':
        return Icons.javascript_rounded;
      case 'memory':
        return Icons.memory_rounded;
      case 'storage':
        return Icons.storage_rounded;
      case 'flutter_dash':
        return Icons.flutter_dash_rounded;
      case 'code':
      default:
        return Icons.code_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Color(int.parse(language.colorHex));

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: color.withValues(alpha: 0.1),
        highlightColor: color.withValues(alpha: 0.05),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getIconData(language.icon),
                      color: color,
                      size: 28,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${language.sheetCount} sheets',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                language.name,
                style: GoogleFonts.inter(
                  color: const Color(0xFFF8FAFC),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                language.category,
                style: GoogleFonts.inter(
                  color: const Color(0xFF94A3B8),
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
