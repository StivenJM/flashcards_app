class Settings {
  final bool isDarkMode;
  final String language;
  final bool enableNotifications;

  Settings({
    required this.isDarkMode,
    required this.language,
    required this.enableNotifications,
  });

  Settings copyWith({
    bool? isDarkMode,
    String? language,
    bool? enableNotifications,
  }) {
    return Settings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
      enableNotifications: enableNotifications ?? this.enableNotifications,
    );
  }
}
