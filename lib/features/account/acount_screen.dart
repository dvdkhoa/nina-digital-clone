import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../core/authentication_user/model/user_model.dart';
import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../shared/constants/api_url.dart';
import '../../shared/utils/helper.dart';
import '../address/address_screen.dart';
import '../help_center/help_center_screen.dart';
import '../notification_settings/notification_setting_screen.dart';
import '../orders/order_screen.dart';
import 'screens/profile/profile_screen.dart';
import '../security/security_screen.dart';
import '../sign_in/sign_in_screen.dart';
import 'package:badges/badges.dart' as badges;

import 'screens/language/language_screen.dart';
import 'providers/account_provider.dart';

part 'widgets/darkmode_widget.dart';
part 'widgets/item_modifier_widget.dart';
part 'widgets/language_widget.dart';
part 'widgets/logout_widget.dart';
part 'widgets/account_info_widget.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  static const String nameRoute = 'account';
  static const String pathRoute = '/account';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

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
                if (userInfo != null) ...[
                  AccountInfoWidget(),
                  const Divider(
                    height: 50,
                  ),
                  _ItemModifier(
                    text: 'Đơn hàng',
                    child: Icon(Icons.arrow_forward_ios, size: 13),
                    onClick: () {
                      context.pushNamed(OrderScreen.nameRoute);
                    },
                  ),
                  _ItemModifier(
                      text: 'Địa chỉ',
                      child: Icon(Icons.arrow_forward_ios, size: 13),
                      onClick: () {
                        context.pushNamed(AddressScreen.nameRoute);
                      }),
                  _ItemModifier(
                    text: 'Thông báo',
                    child: Icon(Icons.arrow_forward_ios, size: 13),
                    onClick: () {
                      context.pushNamed(NotificationSettingScreen.nameRoute);
                    },
                  ),
                  _ItemModifier(
                    text: 'Bảo vệ tài khoản',
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                    ),
                    onClick: () {
                      context.pushNamed(SecurityScreen.nameRoute);
                    },
                  ),
                ] else ...[
                  Container(
                    child: FilledButton(
                      onPressed: () {
                        context.pushNamed(SignInScreen.nameRoute);
                      },
                      child: Text('Đăng nhập'),
                    ),
                  ),
                ],
                _LanguageWidget(),
                _DarkModeWidget(),
                _ItemModifier(
                  text: 'Trung tâm hỗ trợ',
                  child: Icon(Icons.arrow_forward_ios, size: 13),
                  onClick: () {
                    context.pushNamed(HelpCenterScreen.nameRoute);
                  },
                ),
                userInfo != null ? _LogOutWidget() : SizedBox(),
              ],
            ),
          ),
        ));
  }
}

