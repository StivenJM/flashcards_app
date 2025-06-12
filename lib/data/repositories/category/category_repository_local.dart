import '../../../domain/models/category/category.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'category_repository.dart';

class CategoryRepositoryLocal implements CategoryRepository {
  CategoryRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Category>>> getCategories() async {
    try {
      final categories = await _localDataService.getCategories();
      return Result.ok(categories);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> addCategory(Category category) async {
    try {
      await _localDataService.saveCategory(category);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateCategory(Category category) async {
    try {
      await _localDataService.updateCategory(category);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteCategory(String id) async {
    try {
      await _localDataService.deleteCategory(id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
