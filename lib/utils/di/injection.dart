import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zporter_preview/config/app_config.dart';
import 'package:zporter_preview/config/language.dart';
import 'package:zporter_preview/config/theme.dart';
import 'package:zporter_preview/data/login/data_sources/remote/login_api.dart';
import 'package:zporter_preview/data/login/repositories/login_repository_impl.dart';
import 'package:zporter_preview/data/utils/shared_pref_manager.dart';
import 'package:zporter_preview/domain/login/repositories/login_repository.dart';

GetIt getIt = GetIt.instance;
FirebaseAuth auth = FirebaseAuth.instance;

Future setupInjection() async {
  await _registerAppComponents();
  await _registerNetworkComponents();
  _registerRepository();
}

Future _registerAppComponents() async {
  final sharedPreferencesManager = await SharedPreferencesManager.getInstance();
  getIt.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager!);

  final appTheme = AppTheme();
  final languageApp = AppLanguage();
  getIt.registerSingleton(appTheme);
  getIt.registerSingleton(languageApp);
}

Future<void> _registerNetworkComponents() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.getInstance()!.apiBaseUrl,
      connectTimeout: 10000,
    ),
  );
  dio.interceptors.addAll(
    [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    ],
  );
  getIt.registerSingleton(dio);

  getIt
      .registerSingleton(LoginApi(dio, baseUrl: dio.options.baseUrl + 'user/'));
}

void _registerRepository() {
  getIt.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      getIt<LoginApi>(),
    ),
  );
}
