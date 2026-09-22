import 'package:flutter/foundation.dart';

@immutable
class TopicModel {
  final String id;
  final String title;
  final String difficulty;

  const TopicModel({
    required this.id,
    required this.title,
    required this.difficulty,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      difficulty: json['difficulty'] as String? ?? 'Beginner',
    );
  }
}
