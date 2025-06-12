import '../../../domain/models/category/category.dart';
import '../../../utils/result.dart';

abstract class CategoryRepository {
  Future<Result<List<Category>>> getCategories();
  Future<Result<void>> addCategory(Category category);
  Future<Result<void>> updateCategory(Category category);
  Future<Result<void>> deleteCategory(String id);
}
