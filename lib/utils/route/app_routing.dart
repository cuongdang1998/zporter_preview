import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/home/home_route.dart';
import 'package:zporter_preview/presentation/login/sign_up_route.dart';
import 'package:zporter_preview/presentation/media_picker/media_picker_router.dart';
import 'package:zporter_preview/presentation/screen_dashboard/dashboard_route.dart';
import 'package:zporter_preview/presentation/setting/setting_route.dart';
import 'package:zporter_preview/presentation/walk_through/walk_through_route.dart';

enum RouteDefine {
  HomeScreen,
  LoginScreen,
  ListUserScreen,
  SettingScreen,
  DashBoardScreen,
  WalkThroughScreen,
  SignUpVerificationScreen,
  MediaPickerScreen,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.LoginScreen.name: (_) => SignUpRoute.route,
      RouteDefine.HomeScreen.name: (_) => HomeRoute.route,
      RouteDefine.SettingScreen.name: (_) => SettingRoute.route,
      RouteDefine.DashBoardScreen.name: (_) => DashBoardRoute.route,
      RouteDefine.WalkThroughScreen.name: (_) => WalkThroughRoute.route,
      RouteDefine.MediaPickerScreen.name: (_) => MediaPickerRoute.route,
      RouteDefine.SignUpVerificationScreen.name: (_) {
        final args = settings.arguments as BuildContext;
        return SignUpRoute.signUpVerificationRoute(args);
      }
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
