import '../../../domain/models/statistics/statistics.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'statistics_repository.dart';

class StatisticsRepositoryLocal implements StatisticsRepository {
  StatisticsRepositoryLocal({required LocalDataService localDataService})
    : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<Statistics>> getStatistics() async {
    try {
      final statistics = await _localDataService.getStatistics();
      return Result.ok(statistics);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateStatistics(Statistics statistics) async {
    try {
      await _localDataService.saveStatistics(statistics);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
