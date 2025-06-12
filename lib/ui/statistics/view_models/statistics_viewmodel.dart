import 'package:flutter/material.dart';
import '../../../domain/models/statistics/statistics.dart';
import '../../../data/repositories/statistics/statistics_repository.dart';
import '../../../utils/result.dart';

class StatisticsViewModel extends ChangeNotifier {
  StatisticsViewModel({required this.repository});

  final StatisticsRepository repository;

  Statistics? _statistics;
  Statistics? get statistics => _statistics;

  Future<void> loadStatistics() async {
    final result = await repository.getStatistics();
    result.when(
      ok: (data) {
        _statistics = data;
        notifyListeners();
      },
      error: (e) => debugPrint("Error loading statistics: $e"),
    );
  }

  Future<void> updateStatistics(Statistics newStatistics) async {
    final result = await repository.updateStatistics(newStatistics);
    result.when(
      ok: (_) {
        _statistics = newStatistics;
        notifyListeners();
      },
      error: (e) => debugPrint("Error updating statistics: $e"),
    );
  }
}
