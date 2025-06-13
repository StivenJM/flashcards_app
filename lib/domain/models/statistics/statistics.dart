import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

@freezed
abstract class Statistics with _$Statistics {
  const factory Statistics({
    required int totalCardsReviewed,
    required int correctAnswers,
    required int wrongAnswers,
    required DateTime lastReviewed,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, Object?> json) =>
      _$StatisticsFromJson(json);
}
