part of '../acount_screen.dart';

class _LanguageWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang =
    ref.watch(appSettingProvider.select((setting) => setting.language));

    return _ItemModifier(
      text: 'Ngôn ngữ',
      child: Row(
        children: [
          Text(
            lang == 'vi' ? 'Tiếng việt' : 'English',
            style: TextStyle(fontFamily: 'UTM-Avo', color: Color(0xff8D8D8D)),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 13,
          )
        ],
      ),
      onClick: () {
        context.pushNamed(LanguageScreen.nameRoute);
      },
    );
  }
}
