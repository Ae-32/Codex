import 'package:flutter/foundation.dart';
import 'topic_model.dart';

@immutable
class CheatSheetModel {
  final String languageId;
  final List<TopicModel> topics;
  final String rawMarkdown;

  const CheatSheetModel({
    required this.languageId,
    required this.topics,
    required this.rawMarkdown,
  });
}
