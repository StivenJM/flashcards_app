import '../../../utils/result.dart';
import '../../../domain/models/settings/settings.dart';

abstract class SettingsRepository {
  Future<Result<Settings>> getSettings();
  Future<Result<void>> updateSettings(Settings settings);
}
