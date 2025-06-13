import 'package:flutter/foundation.dart';

import '../../../../data/repositories/category/category_repository.dart';
import '../../../../data/repositories/flashcard/flashcard_repository.dart';
import '../../../../domain/models/category/category.dart' as model;
import '../../../../domain/models/flashcard/flashcard.dart' as model;
import '../../../../utils/result.dart';

class CategoryDetailViewModel extends ChangeNotifier {
  final CategoryRepository _categoryRepository;
  final FlashcardRepository _flashcardRepository;

  model.Category? category;
  List<model.Flashcard> flashcards = [];
  bool isLoading = true;

  CategoryDetailViewModel({
    required CategoryRepository categoryRepository,
    required FlashcardRepository flashcardRepository,
  })  : _categoryRepository = categoryRepository,
        _flashcardRepository = flashcardRepository;

  Future<void> load(String categoryId) async {
    isLoading = true;
    notifyListeners();

    // Cargar categoría
    final catResult = await _categoryRepository.getCategories();
    if (catResult is Ok<List<model.Category>>) {
      category = catResult.value.firstWhere(
        (c) => c.id == categoryId,
      );
    }

    // Cargar flashcards de la categoría
    final fcResult = await _flashcardRepository.getFlashcards();
    if (fcResult is Ok<List<model.Flashcard>>) {
      flashcards = fcResult.value.where((f) => f.categoryId == categoryId).toList();
    }

    isLoading = false;
    notifyListeners();
  }
}