import '../../../domain/models/test_result/test_result.dart';
import '../../../utils/result.dart';

abstract class TestResultRepository {
  Future<Result<List<TestResult>>> getTestResults();
  Future<Result<void>> addTestResult(TestResult testResult);
  Future<Result<void>> updateTestResult(TestResult testResult);
  Future<Result<void>> deleteTestResult(String id);
}
