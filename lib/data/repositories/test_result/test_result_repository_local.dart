import '../../../domain/models/test_result/test_result.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'test_result_repository.dart';

class TestResultRepositoryLocal implements TestResultRepository {
  TestResultRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<TestResult>>> getTestResults() async {
    try {
      final testResults = await _localDataService.getTestResults();
      return Result.ok(testResults);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> addTestResult(TestResult testResult) async {
    try {
      await _localDataService.saveTestResult(testResult);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateTestResult(TestResult testResult) async {
    try {
      await _localDataService.updateTestResult(testResult);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteTestResult(String id) async {
    try {
      await _localDataService.deleteTestResult(id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
