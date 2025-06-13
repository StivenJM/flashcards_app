// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Statistics _$StatisticsFromJson(Map<String, dynamic> json) => _Statistics(
  totalCardsReviewed: (json['totalCardsReviewed'] as num).toInt(),
  correctAnswers: (json['correctAnswers'] as num).toInt(),
  wrongAnswers: (json['wrongAnswers'] as num).toInt(),
  lastReviewed: DateTime.parse(json['lastReviewed'] as String),
);

Map<String, dynamic> _$StatisticsToJson(_Statistics instance) =>
    <String, dynamic>{
      'totalCardsReviewed': instance.totalCardsReviewed,
      'correctAnswers': instance.correctAnswers,
      'wrongAnswers': instance.wrongAnswers,
      'lastReviewed': instance.lastReviewed.toIso8601String(),
    };
