import 'package:flutter/material.dart';
import '../../../domain/models/settings/settings.dart';
import '../../../data/repositories/settings/settings_repository.dart';
import '../../../utils/result.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({required this.repository});

  final SettingsRepository repository;

  Settings? _settings;
  Settings? get settings => _settings;

  Future<void> loadSettings() async {
    final result = await repository.getSettings();
    result.when(
      ok: (data) {
        _settings = data;
        notifyListeners();
      },
      error: (e) => debugPrint("Error loading settings: $e"),
    );
  }

  Future<void> updateSettings(Settings newSettings) async {
    final result = await repository.updateSettings(newSettings);
    result.when(
      ok: (_) {
        _settings = newSettings;
        notifyListeners();
      },
      error: (e) => debugPrint("Error updating settings: $e"),
    );
  }
}
