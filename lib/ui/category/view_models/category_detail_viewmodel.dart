import 'package:flutter/foundation.dart';

import '../../../../data/repositories/category/category_repository.dart';
import '../../../../data/repositories/flashcard/flashcard_repository.dart';
import '../../../../domain/models/category/category.dart' as model;
import '../../../../domain/models/flashcard/flashcard.dart' as model;
import '../../../utils/command.dart';
import '../../../../utils/result.dart';

class CategoryDetailViewModel extends ChangeNotifier {
  CategoryDetailViewModel({
    required CategoryRepository categoryRepository,
    required FlashcardRepository flashcardRepository,
    required String categoryId,
  }) : _categoryRepository = categoryRepository, _flashcardRepository = flashcardRepository {
    load = Command1(_load)..execute(categoryId);
    addFlashcard = Command1(_addFlashcard);
    updateFlashcard = Command1(_updateFlashcard);
    deleteFlashcard = Command1(_deleteFlashcard);
  }

  final CategoryRepository _categoryRepository;
  final FlashcardRepository _flashcardRepository;

  model.Category? _category;
  model.Category? get category => _category;
  List<model.Flashcard> _flashcards = [];
  List<model.Flashcard> get flashcards => _flashcards;
  bool isLoading = true;

  late Command1<void, String> load;
  late Command1<void, model.Flashcard> addFlashcard;
  late Command1<void, model.Flashcard> updateFlashcard;
  late Command1<void, String> deleteFlashcard;

  Future<Result<void>> _load(String categoryId) async {
    isLoading = true;
    notifyListeners();

    // Cargar categoría
    final catResult = await _categoryRepository.getCategories();
    if (catResult is Ok<List<model.Category>>) {
      _category = catResult.value.firstWhere(
        (c) => c.id == categoryId,
      );
    }

    // Cargar flashcards de la categoría
    final fcResult = await _flashcardRepository.getFlashcards();
    if (fcResult is Ok<List<model.Flashcard>>) {
      _flashcards = fcResult.value.where((f) => f.categoryId == categoryId).toList();
    }

    isLoading = false;
    notifyListeners();
    return fcResult;
  }

  Future<Result<void>> _addFlashcard(model.Flashcard flashcard) async {
    final result = await _flashcardRepository.addFlashcard(flashcard);
    if (result case Ok()) {
      await _load(_category?.id ?? '');
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _updateFlashcard(model.Flashcard flashcard) async {
    final result = await _flashcardRepository.updateFlashcard(flashcard);
    if (result case Ok()) {
      await _load(_category?.id ?? '');
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _deleteFlashcard(String id) async {
    final result = await _flashcardRepository.deleteFlashcard(id);
    if (result case Ok()) {
      await _load(_category?.id ?? '');
    }
    notifyListeners();
    return result;
  }
}