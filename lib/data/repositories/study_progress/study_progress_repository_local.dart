import '../../../domain/models/study_progress/study_progress.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'study_progress_repository.dart';

class StudyProgressRepositoryLocal implements StudyProgressRepository {
  StudyProgressRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<StudyProgress>>> getStudyProgresses() async {
    try {
      final studyProgresses = await _localDataService.getStudyProgresses();
      return Result.ok(studyProgresses);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> addStudyProgress(StudyProgress studyProgress) async {
    try {
      await _localDataService.saveStudyProgress(studyProgress);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateStudyProgress(StudyProgress studyProgress) async {
    try {
      await _localDataService.updateStudyProgress(studyProgress);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteStudyProgress(String id) async {
    try {
      await _localDataService.deleteStudyProgress(id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
