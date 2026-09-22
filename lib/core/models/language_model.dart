import 'package:flutter/foundation.dart';

@immutable
class LanguageModel {
  final String id;
  final String name;
  final String category;
  final String icon;
  final String colorHex;
  final String description;
  final int sheetCount;

  const LanguageModel({
    required this.id,
    required this.name,
    required this.category,
    required this.icon,
    required this.colorHex,
    required this.description,
    required this.sheetCount,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? 'General',
      icon: json['icon'] as String? ?? 'code',
      colorHex: json['color'] as String? ?? '0xFF38BDF8',
      description: json['description'] as String? ?? '',
      sheetCount: (json['sheetCount'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'icon': icon,
      'color': colorHex,
      'description': description,
      'sheetCount': sheetCount,
    };
  }
}
