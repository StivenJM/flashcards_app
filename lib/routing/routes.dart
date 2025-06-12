abstract final class Routes {
  static const home = '/$homeRelative';
  static const homeRelative = 'home';
  static const newCategory = '/$newCategoryRelative';
  static const newCategoryRelative = 'new-category';
  static const study = '/$studyRelative';
  static const studyRelative = 'study';
  static String editCategory(String categoryId) => '/editCategory/$categoryId';
  static String studyCategory(String categoryId) => '$study/$categoryId';
  static String quiz(String categoryId) => '/quiz/$categoryId';
}
