import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconoir_flutter/regular/expand.dart';
import 'package:isar/isar.dart';
import 'package:nina_digital/shared/providers/account_provider.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../core/authentication_user/model/user_model.dart';
import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../localizations/language_ext.dart';
import '../../shared/constants/api_url.dart';
import '../../shared/utils/ndgap.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:badges/badges.dart' as badges;

import '../cart/cart_screen.dart';
import '../cart/providers/cart_provider.dart';
import '../login/login_screen.dart';
import '../notification/notification_screen.dart';
import '../search/search_screen.dart';
import 'widgets/category_list_widget.dart';
import 'widgets/popular_products_widget.dart';
import 'widgets/section_layout_widget.dart';
import 'widgets/special_offer_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  static const String nameRoute = 'home';
  static const String pathRoute = '/home';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.read(cartProvider.notifier).getCart();
  }

  @override
  Widget build(BuildContext context) {
    final lang = ref
        .watch(appSettingProvider.select((value) => value.language.toString()));
    final theme =
        ref.watch(appSettingProvider.select((value) => value.theme.toString()));

    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

    // final accountAsyncValue =
    //     ref.watch(asyncAccountProvider(userInfo!.id.toString()));

    final totalQuantityCart =
        ref.watch(cartProvider.select((value) => value.total));

    final defaultTextStyle = DefaultTextStyle.of(context).style;

    int index = 0;

    print('rebuild');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 70,
          leading: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Container(
              // height: 50,
              // width: 50,
              width: double.infinity,
              child: CircleAvatar(
                child: Image.asset(
                  'assets/images/boy.png',
                  width: 40,
                  fit: BoxFit.cover,
                ),
                // color: Colors.blueAccent,
                // child: accountAsyncValue.when(
                //   data: (data) {
                //     return CircleAvatar(
                //       child: Image.asset(
                //         'assets/images/boy.png',
                //         width: 40,
                //         fit: BoxFit.cover,
                //       ),
                //     );
                //   },
                //   error: (error, stackTrace) {
                //     print(error.toString());
                //     print(stackTrace.toString());

                //     return CircleAvatar(
                //       child: Image.asset('assets/images/error.png'),
                //     );
                //   },
                //   loading: () => Center(
                //     child: CircularProgressIndicator(),
                //   ),
              ),
            ),
          ),
          title: Container(
            // padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning',
                  style: defaultTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  userInfo?.fullname ?? 'Tài khoản',
                  style: defaultTextStyle.copyWith(fontSize: 20),
                ),
                // accountAsyncValue.when(
                //   data: (data) {
                //     return Text(
                //       data.fullname,
                //       style: defaultTextStyle.copyWith(fontSize: 20),
                //     );
                //   },
                //   error: (error, stackTrace) => Center(
                //     child: Text(error.toString()),
                //   ),
                //   loading: () => Center(
                //     child: CircularProgressIndicator(),
                //   ),
                // ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(NotificationScreen.nameRoute);
              },
              icon: icons.Bell(
                width: 20,
                height: 20,
                color: defaultTextStyle.color,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: badges.Badge(
                badgeContent: Text(
                  totalQuantityCart.toString(),
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                badgeStyle: const badges.BadgeStyle(
                    badgeColor: Color(0xFF0A70B8), padding: EdgeInsets.all(5)),
                badgeAnimation: const badges.BadgeAnimation.slide(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                child: InkWell(
                  onTap: () {
                    context.pushNamed(CartScreen.nameRoute);
                  },
                  child: icons.ShoppingBag(
                    height: 20,
                    width: 20,
                    color: defaultTextStyle.color,
                  ),
                ),
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ref
                .read(asyncAccountProvider(ApiUrl.ACCOUNT_ID).notifier)
                .setInfoAccount(ApiUrl.ACCOUNT_ID);
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(SearchScreen.nameRoute);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey.shade700),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Tìm kiếm',
                                style: TextStyle(color: Colors.grey.shade700),
                              )
                            ],
                          ),
                          Icon(
                            Icons.tune,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SpecialOfferWidget(),
                  const CategoryListWidget(),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset('assets/images/banner.png')),
                  const PopularProductsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// _cateroriesWidget(list) {
//   return list.map(
//     (item) => Column(
//       children: [Image.asset('assets/images/avatar.png'), Text(item['title'])],
//     ),
//   );
// }
