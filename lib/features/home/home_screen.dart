import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../core/authentication_user/model/user_model.dart';
import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../shared/constants/api_url.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:badges/badges.dart' as badges;

import '../../shared/utils/helper.dart';
import '../account/acount_screen.dart';
import '../account/providers/account_provider.dart';
import '../cart/cart_screen.dart';
import '../cart/providers/cart_provider.dart';
import '../notification/notification_screen.dart';
import '../search/search_screen.dart';
import 'widgets/category_list_widget.dart';
import 'widgets/popular_products_widget.dart';
import 'widgets/special_offer_widget.dart';

part 'widgets/account_info_widget.dart';

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

    final defaultTextStyle = DefaultTextStyle.of(context).style;

    int index = 0;

    return SafeArea(
      child: Scaffold(
        appBar: AccountInfoWidget(),
        body: RefreshIndicator(
          onRefresh: () async {
            print('reload');
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

class CartIconWidget extends ConsumerWidget {
  const CartIconWidget({
    super.key,
    required this.totalQuantityCart,
    required this.defaultTextStyle,
  });

  final int totalQuantityCart;
  final TextStyle defaultTextStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authUserProvider,
      (previous, next) {
        if (previous?.status != next.status) {
          ref.read(cartProvider.notifier).getCart();
        }
      },
    );
    return Container(
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
            height: 22,
            width: 22,
            color: defaultTextStyle.color,
          ),
        ),
      ),
    );
  }
}

