import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/home/home_route.dart';
import 'package:zporter_preview/presentation/login/login_route.dart';
import 'package:zporter_preview/presentation/screen_dashboard/dashboard_route.dart';
import 'package:zporter_preview/presentation/setting/setting_route.dart';
import 'package:zporter_preview/presentation/walk_through/walk_through_route.dart';

enum RouteDefine {
  HomeScreen,
  LoginScreen,
  ListUserScreen,
  SettingScreen,
  DashBoardScreen,
  WalkThroughScreen
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.LoginScreen.name: (_) => LoginRoute.route,
      RouteDefine.HomeScreen.name: (_) => HomeRoute.route,
      RouteDefine.SettingScreen.name: (_) => SettingRoute.route,
      RouteDefine.DashBoardScreen.name: (_) => DashBoardRoute.route,
      RouteDefine.WalkThroughScreen.name: (_) => WalkThroughRoute.route,
    };

    final routeBuilder = routes[settings.name];

    return _NoAnimationMaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}

class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(_, __, ___, Widget child) => child;
}

extension RouteExt on Object {
  /// Use this to get the enum value converted to string.
  ///
  /// Eg.
  /// ```dart
  /// print(SomeEnum.someValue.name) // someValue
  /// ```
  ///
  String get name => toString().substring(toString().indexOf('.') + 1);
}
