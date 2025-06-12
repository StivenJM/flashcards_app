import '../../../utils/result.dart';
import '../../../domain/models/statistics/statistics.dart';

abstract class StatisticsRepository {
  Future<Result<Statistics>> getStatistics();
  Future<Result<void>> updateStatistics(Statistics statistics);
}
