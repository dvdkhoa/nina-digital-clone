import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../localizations/language_ext.dart';
import '../../shared/constants/media_assets.dart';
import '../intro_auth/intro_auth_screen.dart';
import 'language/language_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const String nameRoute = 'account';
  static const String pathRoute = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              '${MediaAssets.images}/logo.png',
              height: 35,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text('Tài khoản'),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircleAvatar(
                                child: Image.asset(
                                  '${MediaAssets.images}/avatar.jpg',
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Vũ Mạnh Cường',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'vmcuongnina@gmail.com',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '0909 845 849',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _itemMenu(
              title: 'Đơn hàng',
              onTap: () {},
            ),
            const SizedBox(
              height: 1,
            ),
            _itemMenu(
              title: 'Địa chỉ',
              onTap: () {},
            ),
            const SizedBox(
              height: 1,
            ),
            _itemMenu(
              title: 'Thông báo',
              onTap: () {},
            ),
            const SizedBox(
              height: 1,
            ),
            const _LangWidget(),
            const SizedBox(
              height: 1,
            ),
            const _DarkModeWidget(),
            const SizedBox(
              height: 1,
            ),
            _itemMenu(
              title: 'Trung tâm hỗ trợ',
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Phiên bản 1.0.1',
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const _SignOutButton(),
          ],
        ),
      ),
    );
  }
}

Widget _itemMenu(
    {required String title,
    Function()? onTap,
    String? value,
    Widget? trailing}) {
  return ListTile(
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        if (value != null) ...[
          Text(
            value,
            style: const TextStyle(color: Colors.black45, fontSize: 14),
          )
        ],
      ],
    ),
    trailing: (trailing != null)
        ? trailing
        : (onTap != null)
            ? Container(
                margin: const EdgeInsets.only(top: 6),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              )
            : null,
    tileColor: Colors.white,
    onTap: onTap,
  );
}

class _DarkModeWidget extends ConsumerWidget {
  const _DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme =
        ref.watch(appSettingProvider.select((setting) => setting.theme));
    return _itemMenu(
      title: 'Giao diện tối',
      trailing: Switch.adaptive(
        value: (theme == 'light') ? false : true,
        onChanged: (value) {
          ref
              .read(appSettingProvider.notifier)
              .changeTheme(theme: (theme == 'light') ? 'dark' : 'light');
        },
      ),
    );
  }
}

class _LangWidget extends ConsumerWidget {
  const _LangWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang =
        ref.watch(appSettingProvider.select((setting) => setting.language));
    return _itemMenu(
      title: context.translate.ngonngu,
      value: (lang == 'vi') ? context.translate.vi : context.translate.en,
      onTap: () {
        context.pushNamed(LanguageScreen.nameRoute);
      },
    );
  }
}

class _SignOutButton extends ConsumerWidget {
  const _SignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: Colors.red,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Đăng xuất',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      tileColor: Colors.white,
      onTap: () {
        context.go(IntroAuthScreen.pathRoute);
      },
    );
  }
}
