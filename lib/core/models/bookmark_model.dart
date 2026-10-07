class BookmarkModel {
  final String languageId;
  final String languageName;
  final String topicId;
  final String topicTitle;
  final String difficulty;
  final DateTime savedAt;

  BookmarkModel({
    required this.languageId,
    required this.languageName,
    required this.topicId,
    required this.topicTitle,
    required this.difficulty,
    required this.savedAt,
  });

  Map<String, dynamic> toJson() => {
        'languageId': languageId,
        'languageName': languageName,
        'topicId': topicId,
        'topicTitle': topicTitle,
        'difficulty': difficulty,
        'savedAt': savedAt.toIso8601String(),
      };

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        languageId: json['languageId'] as String,
        languageName: json['languageName'] as String,
        topicId: json['topicId'] as String,
        topicTitle: json['topicTitle'] as String,
        difficulty: json['difficulty'] as String? ?? 'Beginner',
        savedAt: DateTime.parse(json['savedAt'] as String),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkModel &&
          runtimeType == other.runtimeType &&
          languageId == other.languageId &&
          topicId == other.topicId;

  @override
  int get hashCode => languageId.hashCode ^ topicId.hashCode;
}
