import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../config/assets.dart';
import '../../../domain/models/category/category.dart';
import '../../../domain/models/flashcard/flashcard.dart';
import '../../../domain/models/study_progress/study_progress.dart';
import '../../../domain/models/test_result/test_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/models/settings/settings.dart';
import '../../../domain/models/statistics/statistics.dart';

class LocalDataService {
  Future<List<Category>> getCategories() async {
    final json = await _loadStringAsset(Assets.categories);
    return json.map<Category>((e) => Category.fromJson(e)).toList();
  }

  Future<List<Flashcard>> getFlashcards() async {
    final json = await _loadStringAsset(Assets.flashcards);
    return json.map<Flashcard>((e) => Flashcard.fromJson(e)).toList();
  }

  Future<List<StudyProgress>> getStudyProgresses() async {
    final json = await _loadStringAsset(Assets.studyProgresses);
    return json.map<StudyProgress>((e) => StudyProgress.fromJson(e)).toList();
  }

  Future<List<TestResult>> getTestResults() async {
    final json = await _loadStringAsset(Assets.testResults);
    return json.map<TestResult>((e) => TestResult.fromJson(e)).toList();
  }

  // Métodos para simular escritura (en memoria o local DB real en el futuro)
  Future<void> saveCategory(Category category) async {
    // Simular guardado local, implementar con base de datos real o archivo JSON si se desea
  }

  Future<void> updateCategory(Category category) async {
    // Simular actualización
  }

  Future<void> deleteCategory(String id) async {
    // Simular eliminación
  }

  Future<void> saveFlashcard(Flashcard flashcard) async {}
  Future<void> updateFlashcard(Flashcard flashcard) async {}
  Future<void> deleteFlashcard(String id) async {}

  Future<void> saveStudyProgress(StudyProgress progress) async {}
  Future<void> updateStudyProgress(StudyProgress progress) async {}
  Future<void> deleteStudyProgress(String id) async {}

  Future<void> saveTestResult(TestResult result) async {}
  Future<void> updateTestResult(TestResult result) async {}
  Future<void> deleteTestResult(String id) async {}

  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);
    return (jsonDecode(localData) as List).cast<Map<String, dynamic>>();
  }

  //statistics y settings
  static const _reviewedKey = 'reviewed';
  static const _correctKey = 'correct';
  static const _incorrectKey = 'incorrect';

  Future<List<Statistics>> getStatistics() async {
    // final prefs = await SharedPreferences.getInstance();
    // return Statistics(
    //   totalCardsReviewed: prefs.getInt('totalCardsReviewed') ?? 0,
    //   correctAnswers: prefs.getInt('correctAnswers') ?? 0,
    //   wrongAnswers: prefs.getInt('wrongAnswers') ?? 0,
    //   lastReviewed:
    //       DateTime.tryParse(prefs.getString('lastReviewed') ?? '') ??
    //       DateTime.now(),
    // ); //S

    final json = await _loadStringAsset(Assets.statistics);
    return json.map<Statistics>((e) => Statistics.fromJson(e)).toList();
  }

  Future<void> updateStatistics({required bool wasCorrect}) async {
    final prefs = await SharedPreferences.getInstance();
    final reviewed = (prefs.getInt(_reviewedKey) ?? 0) + 1;
    final correct = (prefs.getInt(_correctKey) ?? 0) + (wasCorrect ? 1 : 0);
    final incorrect = (prefs.getInt(_incorrectKey) ?? 0) + (wasCorrect ? 0 : 1);

    await prefs.setInt(_reviewedKey, reviewed);
    await prefs.setInt(_correctKey, correct);
    await prefs.setInt(_incorrectKey, incorrect);
  }

  Future<void> resetStatistics() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_reviewedKey, 0);
    await prefs.setInt(_correctKey, 0);
    await prefs.setInt(_incorrectKey, 0);
  }

  Future<void> saveStatistics(Statistics stats) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalCardsReviewed', stats.totalCardsReviewed);
    await prefs.setInt('correctAnswers', stats.correctAnswers);
    await prefs.setInt('wrongAnswers', stats.wrongAnswers);
    await prefs.setString('lastReviewed', stats.lastReviewed.toIso8601String());
  }

  //Settings
  Future<Settings> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return Settings(
      isDarkMode: prefs.getBool('isDarkMode') ?? false,
      language: prefs.getString('language') ?? 'en',
      enableNotifications: prefs.getBool('enableNotifications') ?? true,
    );
  }

  Future<void> saveSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', settings.isDarkMode);
    await prefs.setString('language', settings.language);
    await prefs.setBool('enableNotifications', settings.enableNotifications);
  }
}
