// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudyProgress _$StudyProgressFromJson(Map<String, dynamic> json) =>
    _StudyProgress(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      totalCards: (json['totalCards'] as num).toInt(),
      knownCards: (json['knownCards'] as num).toInt(),
      unknownCards: (json['unknownCards'] as num).toInt(),
      studiedAt: DateTime.parse(json['studiedAt'] as String),
    );

Map<String, dynamic> _$StudyProgressToJson(_StudyProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'totalCards': instance.totalCards,
      'knownCards': instance.knownCards,
      'unknownCards': instance.unknownCards,
      'studiedAt': instance.studiedAt.toIso8601String(),
    };
