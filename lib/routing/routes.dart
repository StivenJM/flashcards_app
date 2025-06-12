abstract final class Routes {
  static const home = '/';
  static const newCategory = '/$newCategoryRelative';
  static const newCategoryRelative = 'new-category';
  static String editCategory(String categoryId) => '/editCategory/$categoryId';
  static String study(String categoryId) => '/study/$categoryId';
  static String quiz(String categoryId) => '/quiz/$categoryId';
}
