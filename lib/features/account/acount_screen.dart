import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../address/address_screen.dart';
import '../help_center/help_center_screen.dart';
import '../notification/notification_screen.dart';
import '../notification_settings/notification_setting_screen.dart';
import '../orders/order_screen.dart';
import '../profile/profile_screen.dart';
import '../security/security_screen.dart';
import 'language/language_screen.dart';
import 'package:badges/badges.dart' as badges;

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const String nameRoute = 'account';
  static const String pathRoute = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Container(
              margin: EdgeInsets.only(left: 25),
              child: Image.asset('assets/images/g22.png')),
          title: Text('Tài khoản'),
          actions: [
            IconButton(
                onPressed: () {
                  print('search');
                },
                icon: SvgPicture.asset('assets/icons/search.svg'))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 80),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    badges.Badge(
                      badgeContent: Icon(
                        Icons.photo_camera,
                        size: 10,
                      ),
                      position: badges.BadgePosition.bottomEnd(),
                      onTap: () {
                        showModalBottomSheet(
                          useRootNavigator: true,
                          context: context,
                          builder: (context) {
                            return Container(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Center(child: Text('Camera')),
                                ),
                                Divider(
                                  height: 10,
                                ),
                                ListTile(
                                  title: Center(child: Text('Thư viện ảnh')),
                                ),
                                Divider(
                                  height: 10,
                                ),
                                ListTile(
                                  title: Center(
                                      child: Text('Hủy',
                                          style: TextStyle(
                                              color: Colors.redAccent))),
                                ),
                              ],
                            ));
                          },
                        );
                      },
                      badgeStyle:
                          badges.BadgeStyle(badgeColor: Colors.grey.shade300),
                      child: CircleAvatar(
                        child: Image.asset(
                          'assets/images/boy.png',
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 40),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Huu Tho',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text('huuthonina@gmail.com'),
                          Text('0987654321')
                        ],
                      ),
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.pushNamed(ProfileScreen.nameRoute);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xff0A70B8),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                const Divider(
                  height: 50,
                ),
                _itemModifier(
                  text: 'Đơn hàng',
                  child: Icon(Icons.arrow_forward_ios, size: 13),
                  onClick: () {
                    context.pushNamed(OrderScreen.nameRoute);
                  },
                ),
                _itemModifier(
                    text: 'Địa chỉ',
                    child: Icon(Icons.arrow_forward_ios, size: 13),
                    onClick: () {
                      context.pushNamed(AddressScreen.nameRoute);
                    }),
                _itemModifier(
                  text: 'Thông báo',
                  child: Icon(Icons.arrow_forward_ios, size: 13),
                  onClick: () {
                    context.pushNamed(NotificationSettingScreen.nameRoute);
                  },
                ),
                _itemModifier(
                  text: 'Bảo vệ tài khoản',
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                  onClick: () {
                    context.pushNamed(SecurityScreen.nameRoute);
                  },
                ),
                _LanguageWidget(),
                _darkModeWidget(),
                _itemModifier(
                  text: 'Trung tâm hỗ trợ',
                  child: Icon(Icons.arrow_forward_ios, size: 13),
                  onClick: () {
                    context.pushNamed(HelpCenterScreen.nameRoute);
                  },
                ),
                _LogOutWidget(),
              ],
            ),
          ),
        ));
  }
}

class _LogOutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Wrap(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'Đăng xuất',
                        style: TextStyle(fontSize: 20),
                      ),
                      Divider(
                        height: 20,
                      ),
                      Text('Bạn có chắc chắn muốn thoát'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text(
                                'Hủy',
                                style: defaultTextStyle,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffE7E7E7),
                                  padding: EdgeInsets.symmetric(vertical: 15)),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Đồng ý',
                                style: defaultTextStyle.copyWith(
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0a70b8),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Đăng xuất',
              style: TextStyle(fontFamily: 'UTM-Avo', color: Color(0xffE91616)),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 13,
            )
          ],
        ),
      ),
    );
  }
}

class _itemModifier extends StatelessWidget {
  final String text;
  final Widget child;
  final Function? onClick;

  _itemModifier({required this.text, required this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    final defautTextStyle = DefaultTextStyle.of(context).style;

    return InkWell(
      onTap: () {
        if (onClick != null) onClick!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: defautTextStyle.copyWith(fontFamily: 'UTM-Avo'),
            ),
            child
          ],
        ),
      ),
    );
  }
}

class _darkModeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme =
        ref.watch(appSettingProvider.select((setting) => setting.theme));

    return _itemModifier(
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

class _LanguageWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang =
        ref.watch(appSettingProvider.select((setting) => setting.language));

    return _itemModifier(
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
