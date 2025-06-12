import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/settings_viewmodel.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SettingsViewModel>(context);

    final settings = viewModel.settings;

    if (settings == null) {
      viewModel.loadSettings(); // carga inicial
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: settings.isDarkMode,
            onChanged: (value) {
              viewModel.updateSettings(settings.copyWith(isDarkMode: value));
            },
          ),
          ListTile(
            title: const Text("Language"),
            subtitle: Text(settings.language),
          ),
          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: settings.enableNotifications,
            onChanged: (value) {
              viewModel.updateSettings(
                settings.copyWith(enableNotifications: value),
              );
            },
          ),
        ],
      ),
    );
  }
}
