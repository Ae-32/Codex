import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF94A3B8)),
        suffixIcon: onClear != null
            ? IconButton(
                icon: const Icon(Icons.close_rounded, color: Color(0xFF94A3B8)),
                onPressed: onClear,
              )
            : null,
      ),
    );
  }
}
