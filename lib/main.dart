import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/app_config.dart';
import 'config/colors.dart';
import 'config/language.dart';
import 'config/navigation_util.dart';
import 'config/theme.dart';
import 'generated/l10n.dart';
import 'utils/di/injection.dart';
import 'utils/route/app_routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Listen for flavor triggered by iOS / android build
  await const MethodChannel('flavor').invokeMethod<String>('getFlavor').then(
    (String? flavor) async {
      print('one flavor $flavor');
      AppConfig.getInstance(flavorName: flavor);
      print('one ${AppConfig.getInstance()!.apiBaseUrl}');
    },
  ).catchError(
    (error) {
      AppConfig.getInstance(flavorName: "development");
      print('two ${AppConfig.getInstance()!.apiBaseUrl}');
      print('error $error');
    },
  );

  await setupInjection();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTheme appTheme = getIt<AppTheme>();
  AppLanguage appLanguage = getIt<AppLanguage>();

  @override
  void initState() {
    appTheme.addListener(() {
      setState(() {});
    });
    appLanguage.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    appTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.whiteColor, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      builder: () => MaterialApp(
        title: 'Zporter Preview',
        navigatorObservers: <NavigatorObserver>[
          MyApp.observer,
        ],
        navigatorKey: NavigationUtil.rootKey,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteDefine.SettingScreen.name,
        onGenerateRoute: AppRouting.generateRoute,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appTheme.currentTheme,
        locale: AppLanguage.getLanguageCodeLocale(),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
