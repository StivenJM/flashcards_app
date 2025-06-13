abstract final class Routes {
  static const home = '/$homeRelative';
  static const homeRelative = 'home';
  static const study = '/$studyRelative';
  static const studyRelative = 'study';
  static String studyCategory(String categoryId) => '$study/$categoryId';
  static String quiz(String categoryId) => '/quiz/$categoryId';
}
