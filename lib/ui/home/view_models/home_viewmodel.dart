import 'package:flutter/foundation.dart';

import '../../../data/repositories/category/category_repository.dart';
import '../../../domain/models/category/category.dart' as model;
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository {
    load = Command0(_load)..execute();
    addCategory = Command1(_addCategory);
    updateCategory = Command1(_updateCategory);
    deleteCategory = Command1(_deleteCategory);
  }

  final CategoryRepository _categoryRepository;

  List<model.Category> _categories = [];
  List<model.Category> get categories => _categories;

  late Command0 load;
  late Command1<void, model.Category> addCategory;
  late Command1<void, model.Category> updateCategory;
  late Command1<void, String> deleteCategory;

  Future<Result> _load() async {
    final result = await _categoryRepository.getCategories();
    if (result case Ok<List<model.Category>>(:final value)) {
      _categories = value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _addCategory(model.Category category) async {
    final result = await _categoryRepository.addCategory(category);
    if (result case Ok()) {
      await _load();
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _updateCategory(model.Category category) async {
    final result = await _categoryRepository.updateCategory(category);
    if (result case Ok()) {
      await _load();
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _deleteCategory(String id) async {
    final result = await _categoryRepository.deleteCategory(id);
    if (result case Ok()) {
      await _load();
    }
    notifyListeners();
    return result;
  }
}
