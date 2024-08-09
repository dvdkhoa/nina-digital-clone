part of 'app_routes.dart';

List<RouteBase> _danhsachRoute = [
  GoRoute(
    name: OnboardingScreen.nameRoute,
    path: OnboardingScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const OnboardingScreen());
    },
  ),
  GoRoute(
      name: LoginScreen.nameRoute,
      path: LoginScreen.pathRoute,
      pageBuilder: (context, state) {
        return _effectTransitionFade(context, state, const LoginScreen());
      },
      routes: [
        GoRoute(
          name: LoginPasswordScreen.nameRoute,
          path: LoginPasswordScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(
                context, state, const LoginPasswordScreen());
          },
        ),
      ]),
  GoRoute(
    name: RegisterScreen.nameRoute,
    path: RegisterScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const RegisterScreen());
    },
  ),
  GoRoute(
    name: SignUpScreen.nameRoute,
    path: SignUpScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const SignUpScreen());
    },
  ),
  GoRoute(
    name: SignInScreen.nameRoute,
    path: SignInScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const SignInScreen());
    },
  ),
  GoRoute(
    name: ForgotPasswordScreen.nameRoute,
    path: ForgotPasswordScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(
          context, state, const ForgotPasswordScreen());
    },
    routes: [
      GoRoute(
          name: ConfirmCodeScreen.nameRoute,
          path: ConfirmCodeScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(
                context, state, const ConfirmCodeScreen());
          }),
      GoRoute(
          name: ResetPasswordScreen.nameRoute,
          path: ResetPasswordScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(
                context, state, const ResetPasswordScreen());
          }),
    ],
  ),
  GoRoute(
      name: NotificationScreen.nameRoute,
      path: NotificationScreen.pathRoute,
      pageBuilder: (context, state) {
        return _effectTransitionFade(
            context, state, const NotificationScreen());
      }),
  GoRoute(
    name: ProfileScreen.nameRoute,
    path: ProfileScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, ProfileScreen());
    },
  ),
  GoRoute(
    name: HelpCenterScreen.nameRoute,
    path: HelpCenterScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, HelpCenterScreen());
    },
  ),
  GoRoute(
    name: NotificationSettingScreen.nameRoute,
    path: NotificationSettingScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, NotificationSettingScreen());
    },
  ),
  GoRoute(
    name: SecurityScreen.nameRoute,
    path: SecurityScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, SecurityScreen());
    },
  ),
  GoRoute(
    name: CartScreen.nameRoute,
    path: CartScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, CartScreen());
    },
  ),
  GoRoute(
      name: CheckoutScreen.nameRoute,
      path: CheckoutScreen.pathRoute,
      pageBuilder: (context, state) {
        return _effectTransitionFade(context, state, CheckoutScreen());
      },
      routes: [
        GoRoute(
          name: PaymentMethodScreen.nameRoute,
          path: PaymentMethodScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(
                context,
                state,
                PaymentMethodScreen(
                  order: state.extra as OrderModel,
                ));
          },
        ),
        GoRoute(
          name: PromotionScreen.nameRoute,
          path: PromotionScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(context, state, PromotionScreen());
          },
        ),
        GoRoute(
          name: ShipMethodScreen.nameRoute,
          path: ShipMethodScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(context, state, ShipMethodScreen());
          },
        ),
        GoRoute(
          name: SelectAddressScreen.nameRoute,
          path: SelectAddressScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(
                context,
                state,
                SelectAddressScreen(
                  checkedAddress: state.extra as AddressModel,
                ));
          },
        ),
      ]),
  GoRoute(
      name: AddressScreen.nameRoute,
      path: AddressScreen.pathRoute,
      pageBuilder: (context, state) {
        return _effectTransitionFade(context, state, AddressScreen());
      },
      routes: [
        GoRoute(
          name: AddAddressScreen.nameRoute,
          path: AddAddressScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(context, state, AddAddressScreen());
          },
        ),
        GoRoute(
          name: UpdateAddressScreen.nameRoute,
          path: UpdateAddressScreen.pathRoute,
          pageBuilder: (context, state) {
            final addressModel = state.extra as AddressModel;
            return _effectTransitionFade(
              context,
              state,
              UpdateAddressScreen(
                model: addressModel,
              ),
            );
          },
        ),
      ]),
  GoRoute(
    name: SearchScreen.nameRoute,
    path: SearchScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, SearchScreen());
    },
  ),
  GoRoute(
    name: NewsDetailScreen.nameRoute,
    path: NewsDetailScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(
          context,
          state,
          NewsDetailScreen(
            id: state.pathParameters['id'].toString(),
          ));
    },
  ),
  GoRoute(
      name: OrderScreen.nameRoute,
      path: OrderScreen.pathRoute,
      pageBuilder: (context, state) {
        return _effectTransitionFade(context, state, OrderScreen());
      },
      routes: [
        GoRoute(
          name: OrderDetailScreen.nameRoute,
          path: OrderDetailScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(
                context,
                state,
                OrderDetailScreen(
                  id: state.pathParameters['id'].toString(),
                ));
          },
        ),
      ]),
  GoRoute(
    name: ProductCategoryScreen.nameRoute,
    path: ProductCategoryScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(
        context,
        state,
        ProductCategoryScreen(
          titleCategory: state.uri.queryParameters['title'].toString(),
        ),
      );
    },
  ),
  GoRoute(
      name: ReviewScreen.nameRoute,
      path: ReviewScreen.pathRoute,
      pageBuilder: (context, state) {
        return _effectTransitionFade(
          context,
          state,
          ReviewScreen(),
        );
      },
      routes: [
        GoRoute(
          name: AddReviewScreen.nameRoute,
          path: AddReviewScreen.pathRoute,
          pageBuilder: (context, state) {
            return _effectTransitionFade(
              context,
              state,
              AddReviewScreen(),
            );
          },
        ),
      ]),
  addShellRouterMain()
];

ShellRouteBase addShellRouterMain() {
  return StatefulShellRoute.indexedStack(
    pageBuilder: (context, state, navigationShell) {
      return _effectTransitionFade(
          context, state, MainLayout(navigationShell: navigationShell));
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
              name: HomeScreen.nameRoute,
              path: HomeScreen.pathRoute,
              builder: (context, state) {
                return HomeScreen();
              },
              routes: [
                GoRoute(
                  name: SliderSeen.nameRoute,
                  path: SliderSeen.pathRoute,
                  builder: (context, state) {
                    return const SliderSeen();
                  },
                ),
                GoRoute(
                  name: CategoryScreen.nameRoute,
                  path: CategoryScreen.pathRoute,
                  builder: (context, state) {
                    return const CategoryScreen();
                  },
                ),
                GoRoute(
                  name: PopularScreen.nameRoute,
                  path: PopularScreen.pathRoute,
                  builder: (context, state) {
                    return const PopularScreen();
                  },
                ),
                GoRoute(
                  name: ProductDetailScreen.nameRoute,
                  path: ProductDetailScreen.pathRoute,
                  pageBuilder: (context, state) {
                    return _effectTransitionFade(
                        context,
                        state,
                        ProductDetailScreen(
                            productId: state.pathParameters['id']!));
                  },
                ),
              ]),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: FavoriteScreen.nameRoute,
            path: FavoriteScreen.pathRoute,
            builder: (context, state) {
              return const FavoriteScreen();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: BranchScreen.nameRoute,
            path: BranchScreen.pathRoute,
            builder: (context, state) {
              return const BranchScreen();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: NewsScreen.nameRoute,
            path: NewsScreen.pathRoute,
            builder: (context, state) {
              return const NewsScreen();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
              name: AccountScreen.nameRoute,
              path: AccountScreen.pathRoute,
              builder: (context, state) {
                return const AccountScreen();
              },
              routes: [
                GoRoute(
                  name: LanguageScreen.nameRoute,
                  path: LanguageScreen.pathRoute,
                  builder: (context, state) {
                    return LanguageScreen();
                  },
                ),
              ]),
        ],
      ),
    ],
  );
}

CustomTransitionPage _effectTransitionFade(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
