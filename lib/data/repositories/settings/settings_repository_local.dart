import '../../../domain/models/settings/settings.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'settings_repository.dart';

class SettingsRepositoryLocal implements SettingsRepository {
  SettingsRepositoryLocal({required LocalDataService localDataService})
    : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<Settings>> getSettings() async {
    try {
      final settings = await _localDataService.getSettings();
      return Result.ok(settings);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateSettings(Settings settings) async {
    try {
      await _localDataService.saveSettings(settings);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
