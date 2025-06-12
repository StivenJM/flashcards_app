import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static const LocalizationsDelegate<AppLocalization> delegate = AppLocalizationDelegate();

  static const _localizedStrings = <String, Map<String, String>>{
    'en': {
      'homeTitle': 'Home',
      'studyTitle': 'Study',
      'statisticsTitle': 'Statistics',
      'settingsTitle': 'Settings',
      'categories': 'Categories',
      'flashcards': 'Flashcards',
      'studyProgress': 'Study Progress',
      'testResults': 'Test Results',
      'addCategory': 'Add Category',
      'editCategory': 'Edit Category',
      'deleteCategory': 'Delete Category',
      'addFlashcard': 'Add Flashcard',
      'editFlashcard': 'Edit Flashcard',
      'deleteFlashcard': 'Delete Flashcard',
      'save': 'Save',
      'cancel': 'Cancel',
      'confirm': 'Confirm',
      'yes': 'Yes',
      'no': 'No',
      'errorLoadingCategories': 'Error loading categories',
      'errorLoadingFlashcards': 'Error loading flashcards',
      'errorLoadingProgress': 'Error loading study progress',
      'errorLoadingResults': 'Error loading test results',
      'errorSavingData': 'Error saving data',
      'studyNow': 'Study',
      'quiz': 'Quiz',
      'tryAgain': 'Try again',
      'loading': 'Loading...',
      'noData': 'No data available',
    },
    'es': {
      'homeTitle': 'Inicio',
      'studyTitle': 'Estudiar',
      'statisticsTitle': 'Estadísticas',
      'settingsTitle': 'Ajustes',
      'categories': 'Categorías',
      'flashcards': 'Tarjetas',
      'studyProgress': 'Progreso de estudio',
      'testResults': 'Resultados de prueba',
      'addCategory': 'Añadir categoría',
      'editCategory': 'Editar categoría',
      'deleteCategory': 'Eliminar categoría',
      'addFlashcard': 'Añadir tarjeta',
      'editFlashcard': 'Editar tarjeta',
      'deleteFlashcard': 'Eliminar tarjeta',
      'save': 'Guardar',
      'cancel': 'Cancelar',
      'confirm': 'Confirmar',
      'yes': 'Sí',
      'no': 'No',
      'errorLoadingCategories': 'Error al cargar categorías',
      'errorLoadingFlashcards': 'Error al cargar tarjetas',
      'errorLoadingProgress': 'Error al cargar el progreso',
      'errorLoadingResults': 'Error al cargar los resultados',
      'errorSavingData': 'Error al guardar datos',
      'studyNow': 'Estudiar',
      'quiz': 'Examen',
      'tryAgain': 'Inténtalo de nuevo',
      'loading': 'Cargando...',
      'noData': 'No hay datos disponibles',
    },
  };


  String _get(String label) {
    return _localizedStrings[locale.languageCode]?[label] ??
        _localizedStrings['en']?[label] ??
        '[${label.toUpperCase()}]';
  }

  // Getters
  String get homeTitle => _get('homeTitle');
  String get studyTitle => _get('studyTitle');
  String get statisticsTitle => _get('statisticsTitle');
  String get settingsTitle => _get('settingsTitle');
  String get categories => _get('categories');
  String get flashcards => _get('flashcards');
  String get studyProgress => _get('studyProgress');
  String get testResults => _get('testResults');
  String get addCategory => _get('addCategory');
  String get editCategory => _get('editCategory');
  String get deleteCategory => _get('deleteCategory');
  String get addFlashcard => _get('addFlashcard');
  String get editFlashcard => _get('editFlashcard');
  String get deleteFlashcard => _get('deleteFlashcard');
  String get save => _get('save');
  String get cancel => _get('cancel');
  String get confirm => _get('confirm');
  String get yes => _get('yes');
  String get no => _get('no');
  String get errorLoadingCategories => _get('errorLoadingCategories');
  String get errorLoadingFlashcards => _get('errorLoadingFlashcards');
  String get errorLoadingProgress => _get('errorLoadingProgress');
  String get errorLoadingResults => _get('errorLoadingResults');
  String get errorSavingData => _get('errorSavingData');
  String get studyNow => _get('studyNow');
  String get quiz => _get('quiz');
  String get tryAgain => _get('tryAgain');
  String get loading => _get('loading');
  String get noData => _get('noData');
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;
}
