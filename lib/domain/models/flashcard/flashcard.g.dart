// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Flashcard _$FlashcardFromJson(Map<String, dynamic> json) => _Flashcard(
  id: json['id'] as String,
  categoryId: json['categoryId'] as String,
  front: json['front'] as String,
  back: json['back'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$FlashcardToJson(_Flashcard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'front': instance.front,
      'back': instance.back,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
