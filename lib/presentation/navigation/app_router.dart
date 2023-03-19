import 'package:auto_route/auto_route.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:template/presentation/screens/auth/auth_view.dart';
import 'package:template/presentation/screens/chats/chats_view.dart';
import 'package:template/presentation/screens/dashboard/dashboard_view.dart';
import 'package:template/presentation/screens/dashboard/details/dashboard_details_view.dart';
import 'package:template/presentation/screens/root/root_view.dart';

import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'View,Route,Widget',
  transitionsBuilder: fadeInTransition,
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthView,
      name: 'AuthViewRoute',
      path: 'login',
    ),
    AutoRoute(
      page: RootView,
      path: '/',
      initial: true,
      guards: [AuthGuard],
      children: <AutoRoute>[
        AutoRoute(
          path: 'chats',
          page: ChatsView,
          initial: true,
        ),
        AutoRoute(
          page: EmptyRouterPage,
          path: 'dashboard',
          name: 'DashboardRouter',
          children: [
            AutoRoute(
              path: '',
              initial: true,
              page: DashboardView,
            ),
            AutoRoute(
              path: ':id',
              initial: true,
              page: DashboardDetailsView,
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}

class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({Key? key}) : super(key: key);
}

Widget fadeInTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(
      opacity: animation,
      child: child,
    );
