abstract final class Routes {
  static const home = '/$homeRelative';
  static const homeRelative = 'home';
  static const study = '/$studyRelative';
  static const studyRelative = 'study';
  static const statistics = '/$statisticsRelative';
  static const statisticsRelative = 'statistics';
  static const category = '/$categoryRelative';
  static const categoryRelative = 'category';
  static const quiz = '/$quizRelative';
  static const quizRelative = 'quiz';
  static const studySession = '/$studySessionRelative';
  static const studySessionRelative = 'study-session';
  static String viewCategory(String categoryId) => '$category/$categoryId';
  static String studyCategory(String categoryId) => '$study/$categoryId';
  static String studySessionCategory(String categoryId) => '$studySession/$categoryId';
  static String quizCategory(String categoryId) => '$quiz/$categoryId';
}
