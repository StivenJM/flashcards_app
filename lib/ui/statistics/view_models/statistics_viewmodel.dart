import 'package:flutter/foundation.dart';

import '../../../domain/models/statistics/statistics.dart';
import '../../../data/repositories/statistics/statistics_repository.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class StatisticsViewModel extends ChangeNotifier {
  StatisticsViewModel({required StatisticsRepository repository})
      : _repository = repository {
    load = Command0(_load)..execute();
    updateStatistics = Command1(_update);
  }

  final StatisticsRepository _repository;

  Statistics? _statistics;
  Statistics? get statistics => _statistics;

  late Command0 load;
  late Command1<void, Statistics> updateStatistics;

  Future<Result> _load() async {
    final result = await _repository.getStatistics();
    if (result case Ok<List<Statistics>>(:final value)) {
      _statistics = value[0];
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _update(Statistics updated) async {
    final result = await _repository.updateStatistics(updated);
    if (result case Ok()) {
      _statistics = updated;
    }
    notifyListeners();
    return result;
  }
}
