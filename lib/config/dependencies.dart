import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/services/local/local_data_service.dart';
import '../data/repositories/category/category_repository.dart';
import '../data/repositories/category/category_repository_local.dart';
import '../data/repositories/flashcard/flashcard_repository.dart';
import '../data/repositories/flashcard/flashcard_repository_local.dart';
import '../data/repositories/study_progress/study_progress_repository.dart';
import '../data/repositories/study_progress/study_progress_repository_local.dart';
import '../data/repositories/test_result/test_result_repository.dart';
import '../data/repositories/test_result/test_result_repository_local.dart';

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
List<SingleChildWidget> get providersLocal {
  return [
    Provider.value(value: LocalDataService()),
    Provider(
      create:
          (context) =>
              CategoryRepositoryLocal(localDataService: context.read())
                  as CategoryRepository,
    ),
    Provider(
      create:
          (context) =>
              FlashcardRepositoryLocal(localDataService: context.read())
                  as FlashcardRepository,
    ),
    Provider(
      create:
          (context) =>
              StudyProgressRepositoryLocal(localDataService: context.read())
                  as StudyProgressRepository,
    ),
    Provider(
      create:
          (context) =>
              TestResultRepositoryLocal(localDataService: context.read())
                  as TestResultRepository,
    ),
  ];
}
