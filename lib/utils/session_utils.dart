import 'package:zporter_preview/data/utils/shared_pref_manager.dart';

import 'di/injection.dart';

class SessionUtils {
  static void saveAccessToken(String accessToken) =>
      getIt.get<SharedPreferencesManager>().putString(
            SharedPreferenceKey.keyAccessToken,
            accessToken,
          );

  static void saveLanguageCode(String languageCode) =>
      getIt.get<SharedPreferencesManager>().putString(
            SharedPreferenceKey.languageCode,
            languageCode,
          );
}
