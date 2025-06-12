import '../../../domain/models/study_progress/study_progress.dart';
import '../../../utils/result.dart';

abstract class StudyProgressRepository {
  Future<Result<List<StudyProgress>>> getStudyProgresses();
  Future<Result<void>> addStudyProgress(StudyProgress studyProgress);
  Future<Result<void>> updateStudyProgress(StudyProgress studyProgress);
  Future<Result<void>> deleteStudyProgress(String id);
}
