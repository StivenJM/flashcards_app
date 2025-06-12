import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_progress.freezed.dart';
part 'study_progress.g.dart';

@freezed
abstract class StudyProgress with _$StudyProgress {
  const factory StudyProgress({
    required String id,
    required String categoryId,
    required int totalCards,
    required int knownCards,
    required int unknownCards,
    required DateTime studiedAt,
  }) = _StudyProgress;

  factory StudyProgress.fromJson(Map<String, Object?> json) =>
      _$StudyProgressFromJson(json);
}
