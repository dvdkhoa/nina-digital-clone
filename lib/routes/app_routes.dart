import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/forgot_password/forgot_password_screen.dart';
import 'package:nina_digital/features/forgot_password/screens/confirm_code_screen.dart';
import 'package:nina_digital/features/forgot_password/screens/reset_password_screen.dart';

import '../core/app_setttings/app_setting_provider.dart';
import '../features/account/acount_screen.dart';
import '../features/account/language/language_screen.dart';
import '../features/address/add_address_screen.dart';
import '../features/address/address_screen.dart';
import '../features/address/models/AddressModel.dart';
import '../features/address/update_address_screen.dart';
import '../features/checkout/select_address_screen.dart';
import '../features/branch/branch_screen.dart';
import '../features/cart/cart_screen.dart';
import '../features/checkout/checkout_screen.dart';
import '../features/favorite/favorite_screen.dart';
import '../features/help_center/help_center_screen.dart';
import '../features/home/home_screen.dart';
import '../features/home/screens/category_screen.dart';
import '../features/home/screens/popular_screen.dart';
import '../features/home/screens/slider_sreen.dart';
import '../features/login/login_password_screen.dart';
import '../features/main_layout.dart';
import '../features/news/news_detail_screen.dart';
import '../features/news/news_screen.dart';
import '../features/notification/notification_screen.dart';
import '../features/notification_settings/notification_setting_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/orders/order_detail_screen.dart';
import '../features/orders/order_screen.dart';
import '../features/payment/payment_method_screen.dart';
import '../features/product/product_detail_screen.dart';
import '../features/product_category/product_category_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/promotion/promotion_screen.dart';
import '../features/register/register_screen.dart';
import '../features/reviews/add_review_screen.dart';
import '../features/reviews/review_screen.dart';
import '../features/search/search_screen.dart';
import '../features/security/security_screen.dart';
import '../features/checkout/ship_method_screen.dart';
import '../features/sign_in/sign_in_screen.dart';
import '../shared/app_config.dart';
import '../shared/common_widgets/error_404_widget.dart';
import '../features/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/authentication_user/providers/auth_user_provider.dart';
import '../features/forgot_password/forgot_password_screen.dart';
import '../features/sign_up/sign_up_screen.dart';
import '../shared/app_config.dart';

part 'routes.dart';
part 'app_router_notifier.dart';

final _routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  final loadOnboarding =
      ref.watch(appSettingProvider.select((value) => value.onboarding));

  return GoRouter(
    navigatorKey: _routerKey,
    debugLogDiagnostics: AppConfig.debugLogDiagnostics,
    initialLocation: AppConfig.initialPath,
    // initialLocation:
    //     (loadOnboarding == false && AppConfig.pathOnboarding.isNotEmpty)
    //         ? AppConfig.pathOnboarding
    //         : AppConfig.initialPath,
    refreshListenable: notifier,
    routes: _danhsachRoute,
    redirect: notifier.redirect,
    errorPageBuilder: (context, state) =>
        _effectTransitionFade(context, state, const Error404Widget()),
  );
});
