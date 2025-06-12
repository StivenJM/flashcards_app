import '../../../domain/models/flashcard/flashcard.dart';
import '../../../utils/result.dart';

abstract class FlashcardRepository {
  Future<Result<List<Flashcard>>> getFlashcards();
  Future<Result<void>> addFlashcard(Flashcard flashcard);
  Future<Result<void>> updateFlashcard(Flashcard flashcard);
  Future<Result<void>> deleteFlashcard(String id);
}
