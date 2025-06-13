import 'package:flutter/foundation.dart';
import '../../../data/repositories/flashcard/flashcard_repository.dart';
import '../../../data/repositories/category/category_repository.dart';
import '../../../domain/models/flashcard/flashcard.dart' as model;
import '../../../domain/models/category/category.dart' as model;
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class StudySessionViewModel extends ChangeNotifier {
  StudySessionViewModel({
    required CategoryRepository categoryRepository,
    required FlashcardRepository flashcardRepository,
    required String categoryId,
  })  : _categoryRepository = categoryRepository,
        _flashcardRepository = flashcardRepository,
        _categoryId = categoryId {
    load = Command0(_load)..execute();
  }

  final CategoryRepository _categoryRepository;
  final FlashcardRepository _flashcardRepository;
  final String _categoryId;

  late Command0 load;

  model.Category? _category;
  List<model.Flashcard> _flashcards = [];
  int _currentIndex = 0;
  bool _showAnswer = false;

  model.Category? get category => _category;
  List<model.Flashcard> get flashcards => _flashcards;
  int get currentIndex => _currentIndex;
  bool get showAnswer => _showAnswer;

  model.Flashcard? get currentFlashcard =>
      (_currentIndex < flashcards.length) ? flashcards[_currentIndex] : null;

  double get progress => flashcards.isEmpty ? 0 : (_currentIndex + 1) / flashcards.length;

  Future<Result<void>> _load() async {
    final catResult = await _categoryRepository.getCategories();
    if (catResult is Ok<List<model.Category>>) {
      _category = catResult.value.firstWhere((c) => c.id == _categoryId);
    }
    final fcResult = await _flashcardRepository.getFlashcards();
    if (fcResult is Ok<List<model.Flashcard>>) {
      _flashcards = fcResult.value.where((f) => f.categoryId == _categoryId).toList();
    }
    _currentIndex = 0;
    _showAnswer = false;
    notifyListeners();
    return Result.ok(null);
  }

  void showAnswerToggle() {
    _showAnswer = !_showAnswer;
    notifyListeners();
  }

  void nextCard() {
    if (_currentIndex < _flashcards.length - 1) {
      _currentIndex++;
      _showAnswer = false;
      notifyListeners();
    }
  }

  void previousCard() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _showAnswer = false;
      notifyListeners();
    }
  }
}