// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AuthView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RootViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const RootView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatsViewRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ChatsViewRouteArgs>(
          orElse: () =>
              ChatsViewRouteArgs(chatId: queryParams.optString('chatId')));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ChatsView(
          key: args.key,
          chatId: args.chatId,
        ),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardDetailsViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<DashboardDetailsViewRouteArgs>(
          orElse: () => DashboardDetailsViewRouteArgs(
                id: pathParams.getString('id'),
                type: queryParams.getInt(
                  'type',
                  1,
                ),
              ));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DashboardDetailsView(
          key: args.key,
          id: args.id,
          type: args.type,
        ),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthViewRoute.name,
          path: 'login',
        ),
        RouteConfig(
          RootViewRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: RootViewRoute.name,
              redirectTo: 'chats',
              fullMatch: true,
            ),
            RouteConfig(
              ChatsViewRoute.name,
              path: 'chats',
              parent: RootViewRoute.name,
            ),
            RouteConfig(
              DashboardRouter.name,
              path: 'dashboard',
              parent: RootViewRoute.name,
              children: [
                RouteConfig(
                  DashboardViewRoute.name,
                  path: '',
                  parent: DashboardRouter.name,
                ),
                RouteConfig(
                  DashboardDetailsViewRoute.name,
                  path: ':id',
                  parent: DashboardRouter.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [AuthView]
class AuthViewRoute extends PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: 'login',
        );

  static const String name = 'AuthViewRoute';
}

/// generated route for
/// [RootView]
class RootViewRoute extends PageRouteInfo<void> {
  const RootViewRoute({List<PageRouteInfo>? children})
      : super(
          RootViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootViewRoute';
}

/// generated route for
/// [ChatsView]
class ChatsViewRoute extends PageRouteInfo<ChatsViewRouteArgs> {
  ChatsViewRoute({
    Key? key,
    String? chatId,
  }) : super(
          ChatsViewRoute.name,
          path: 'chats',
          args: ChatsViewRouteArgs(
            key: key,
            chatId: chatId,
          ),
          rawQueryParams: {'chatId': chatId},
        );

  static const String name = 'ChatsViewRoute';
}

class ChatsViewRouteArgs {
  const ChatsViewRouteArgs({
    this.key,
    this.chatId,
  });

  final Key? key;

  final String? chatId;

  @override
  String toString() {
    return 'ChatsViewRouteArgs{key: $key, chatId: $chatId}';
  }
}

/// generated route for
/// [EmptyRouterPage]
class DashboardRouter extends PageRouteInfo<void> {
  const DashboardRouter({List<PageRouteInfo>? children})
      : super(
          DashboardRouter.name,
          path: 'dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRouter';
}

/// generated route for
/// [DashboardView]
class DashboardViewRoute extends PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '',
        );

  static const String name = 'DashboardViewRoute';
}

/// generated route for
/// [DashboardDetailsView]
class DashboardDetailsViewRoute
    extends PageRouteInfo<DashboardDetailsViewRouteArgs> {
  DashboardDetailsViewRoute({
    Key? key,
    required String id,
    int type = 1,
  }) : super(
          DashboardDetailsViewRoute.name,
          path: ':id',
          args: DashboardDetailsViewRouteArgs(
            key: key,
            id: id,
            type: type,
          ),
          rawPathParams: {'id': id},
          rawQueryParams: {'type': type},
        );

  static const String name = 'DashboardDetailsViewRoute';
}

class DashboardDetailsViewRouteArgs {
  const DashboardDetailsViewRouteArgs({
    this.key,
    required this.id,
    this.type = 1,
  });

  final Key? key;

  final String id;

  final int type;

  @override
  String toString() {
    return 'DashboardDetailsViewRouteArgs{key: $key, id: $id, type: $type}';
  }
}
