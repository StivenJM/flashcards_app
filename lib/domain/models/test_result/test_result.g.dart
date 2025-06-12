// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestResult _$TestResultFromJson(Map<String, dynamic> json) => _TestResult(
  id: json['id'] as String,
  categoryId: json['categoryId'] as String,
  correctAnswers: (json['correctAnswers'] as num).toInt(),
  incorrectAnswers: (json['incorrectAnswers'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$TestResultToJson(_TestResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'correctAnswers': instance.correctAnswers,
      'incorrectAnswers': instance.incorrectAnswers,
      'date': instance.date.toIso8601String(),
    };
