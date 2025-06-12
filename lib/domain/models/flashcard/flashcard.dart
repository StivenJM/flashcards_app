import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard.freezed.dart';
part 'flashcard.g.dart';

@freezed
abstract class Flashcard with _$Flashcard {
  const factory Flashcard({
    required String id,
    required String categoryId,
    required String front,
    required String back,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Flashcard;

  factory Flashcard.fromJson(Map<String, Object?> json) =>
      _$FlashcardFromJson(json);
}
