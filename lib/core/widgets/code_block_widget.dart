import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeBlockWidget extends StatefulWidget {
  final String code;
  final String language;

  const CodeBlockWidget({
    super.key,
    required this.code,
    required this.language,
  });

  @override
  State<CodeBlockWidget> createState() => _CodeBlockWidgetState();
}

class _CodeBlockWidgetState extends State<CodeBlockWidget> {
  bool _copied = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _copied = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code copied to clipboard!'),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF38BDF8),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F19),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF161E2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.language.toUpperCase(),
                    style: GoogleFonts.firaCode(
                      color: const Color(0xFF38BDF8),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: _copyToClipboard,
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Row(
                      children: [
                        Icon(
                          _copied ? Icons.check_circle : Icons.copy_rounded,
                          size: 14,
                          color: _copied ? const Color(0xFF4ADE80) : const Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _copied ? 'Copied' : 'Copy',
                          style: GoogleFonts.inter(
                            color: _copied ? const Color(0xFF4ADE80) : const Color(0xFF94A3B8),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Code Display with Syntax Highlighting
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(14),
            child: HighlightView(
              widget.code.trim(),
              language: widget.language.isEmpty ? 'plaintext' : widget.language.toLowerCase(),
              theme: themeMap['atom-one-dark'] ?? {},
              textStyle: GoogleFonts.firaCode(fontSize: 13, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
