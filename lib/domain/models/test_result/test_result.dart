import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_result.freezed.dart';
part 'test_result.g.dart';

@freezed
abstract class TestResult with _$TestResult {
  const factory TestResult({
    required String id,
    required String categoryId,
    required int correctAnswers,
    required int incorrectAnswers,
    required DateTime date,
  }) = _TestResult;

  factory TestResult.fromJson(Map<String, Object?> json) =>
      _$TestResultFromJson(json);
}
