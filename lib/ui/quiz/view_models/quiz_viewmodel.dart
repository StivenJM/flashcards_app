import 'package:flutter/foundation.dart';

import '../../../data/repositories/flashcard/flashcard_repository.dart';
import '../../../data/repositories/category/category_repository.dart';
import '../../../data/repositories/test_result/test_result_repository.dart';
import '../../../domain/models/flashcard/flashcard.dart' as model;
import '../../../domain/models/category/category.dart' as model;
import '../../../domain/models/test_result/test_result.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class QuizViewModel extends ChangeNotifier {
  QuizViewModel({
    required CategoryRepository categoryRepository,
    required FlashcardRepository flashcardRepository,
    required TestResultRepository testResultRepository,
    required String categoryId,
  })  : _categoryRepository = categoryRepository,
        _flashcardRepository = flashcardRepository,
        _testResultRepository = testResultRepository,
        _categoryId = categoryId {
    load = Command0(_load)..execute();
  }

  final CategoryRepository _categoryRepository;
  final FlashcardRepository _flashcardRepository;
  final TestResultRepository _testResultRepository;
  final String _categoryId;

  late Command0 load;

  model.Category? _category;
  List<model.Flashcard> _flashcards = [];
  int _currentIndex = 0;
  bool _showAnswer = false;
  int _correct = 0;
  int _incorrect = 0;

  model.Category? get category => _category;
  List<model.Flashcard> get flashcards => _flashcards;
  int get currentIndex => _currentIndex;
  bool get showAnswer => _showAnswer;
  int get correct => _correct;
  int get incorrect => _incorrect;

  double get progress => flashcards.isEmpty ? 0 : (_currentIndex + 1) / flashcards.length;

  model.Flashcard? get currentFlashcard =>
      (_currentIndex < flashcards.length) ? flashcards[_currentIndex] : null;

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
    _correct = 0;
    _incorrect = 0;
    notifyListeners();
    return Result.ok(null);
  }

  void showAnswerToggle() {
    _showAnswer = !_showAnswer;
    notifyListeners();
  }

  Future<void> answer(bool isCorrect) async {
    if (isCorrect) {
      _correct++;
    } else {
      _incorrect++;
    }
    _showAnswer = false;
    if (_currentIndex < _flashcards.length - 1) {
      _currentIndex++;
      notifyListeners();
    } else {
      // Save result
      await _testResultRepository.addTestResult(
        TestResult(
          id: UniqueKey().toString(),
          categoryId: _categoryId,
          correctAnswers: _correct,
          incorrectAnswers: _incorrect,
          date: DateTime.now(),
        ),
      );
      notifyListeners();
      // Optionally: show a dialog or navigate back
    }
  }
}