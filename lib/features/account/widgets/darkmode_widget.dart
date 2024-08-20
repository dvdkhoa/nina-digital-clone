part of '../acount_screen.dart';

class _DarkModeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme =
    ref.watch(appSettingProvider.select((setting) => setting.theme));

    return _ItemModifier(
      text: 'Dark Mode',
      child: SizedBox(
        height: 30,
        width: 30,
        child: FittedBox(
          child: Switch.adaptive(
            value: (theme == 'dark'),
            onChanged: (value) {
              ref
                  .read(appSettingProvider.notifier)
                  .changeTheme(theme: value ? 'dark' : 'light');
            },
          ),
        ),
      ),
    );
  }
}
