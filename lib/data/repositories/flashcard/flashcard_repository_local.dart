import '../../../domain/models/flashcard/flashcard.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'flashcard_repository.dart';

class FlashcardRepositoryLocal implements FlashcardRepository {
  FlashcardRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Flashcard>>> getFlashcards() async {
    try {
      final flashcards = await _localDataService.getFlashcards();
      return Result.ok(flashcards);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> addFlashcard(Flashcard flashcard) async {
    try {
      await _localDataService.saveFlashcard(flashcard);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateFlashcard(Flashcard flashcard) async {
    try {
      await _localDataService.updateFlashcard(flashcard);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteFlashcard(String id) async {
    try {
      await _localDataService.deleteFlashcard(id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
