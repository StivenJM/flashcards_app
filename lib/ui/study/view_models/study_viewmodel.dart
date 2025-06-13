import 'package:flutter/foundation.dart';

import '../../../data/repositories/category/category_repository.dart';
import '../../../domain/models/category/category.dart' as model;
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class StudyViewModel extends ChangeNotifier {
  StudyViewModel({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository {
    load = Command0(_load)..execute();
  }
  
  final CategoryRepository _categoryRepository;

  late Command0 load;

  List<model.Category> _categories = [];
  List<model.Category> get categories => _categories;

  Future<Result> _load() async {
    try {
      final result = await _categoryRepository.getCategories();
      if (result case Ok<List<model.Category>>(:final value)) {
        _categories = value;
      }
      return result;
    } finally {
      notifyListeners();
    }
  }
}
