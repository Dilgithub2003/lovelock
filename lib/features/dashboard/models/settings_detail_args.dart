/// Title passed to [SettingsDetailScreen] via navigation extra.
class SettingsDetailArgs {
  const SettingsDetailArgs({
    required this.title,
    this.message,
  });

  final String title;
  final String? message;
}
