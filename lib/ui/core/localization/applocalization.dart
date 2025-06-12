import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  static const _strings = <String, String>{
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
    'studyNow': 'Study Now',
    'testYourself': 'Test Yourself',
    'tryAgain': 'Try again',
    'loading': 'Loading...',
    'noData': 'No data available',
  };

  static String _get(String label) => _strings[label] ?? '[${label.toUpperCase()}]';

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
  String get testYourself => _get('testYourself');
  String get tryAgain => _get('tryAgain');
  String get loading => _get('loading');
  String get noData => _get('noData');
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;
}
