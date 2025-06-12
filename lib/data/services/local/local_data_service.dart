import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../config/assets.dart';
import '../../../domain/models/category/category.dart';
import '../../../domain/models/flashcard/flashcard.dart';
import '../../../domain/models/study_progress/study_progress.dart';
import '../../../domain/models/test_result/test_result.dart';

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
}
