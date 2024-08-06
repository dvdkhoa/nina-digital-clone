import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_setttings/app_setting_provider.dart';

class LanguageScreen extends ConsumerStatefulWidget {
  LanguageScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'language';
  static const String pathRoute = 'language';

  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  final languages = [
    {'code': 'vi', 'title': 'Tiếng việt'},
    {'code': 'en', 'title': 'Tiếng Anh'},
  ];

  String? _selectedLanguage;

  _onSelectLanguage(code) {
    setState(() {
      _selectedLanguage = code;
    });
  }

  @override
  void initState() {
    _selectedLanguage =
        ref.read(appSettingProvider.select((setting) => setting.language));
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ngôn ngữ'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final isChecked =
                languages[index]['code'].toString() == _selectedLanguage;

            return ListTile(
              selected: isChecked,
              leading: isChecked ? Icon(Icons.check_rounded) : null,
              title: Text(
                languages[index]['title'].toString(),
              ),
              onTap: () {
                print('click');
                _onSelectLanguage(languages[index]['code'].toString());
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(color: Colors.white, boxShadow: []),
        child: ElevatedButton(
          child: Text(
            'Cập nhật',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {
            ref
                .read(appSettingProvider.notifier)
                .changeLanguage(language: _selectedLanguage.toString());
            context.pop();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
