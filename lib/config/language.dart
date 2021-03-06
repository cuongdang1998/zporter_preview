import 'package:flutter/cupertino.dart';
import 'package:zporter_preview/data/utils/shared_pref_manager.dart';
import 'package:zporter_preview/generated/l10n.dart';
import 'package:zporter_preview/presentation/setting/ui/settings/widget_settings/country_language_model.dart';
import 'package:zporter_preview/utils/di/injection.dart';
import 'package:zporter_preview/utils/session_utils.dart';

class AppLanguage with ChangeNotifier {
  static String? getLanguageCode() => getIt
      .get<SharedPreferencesManager>()
      .getString(SharedPreferenceKey.languageCode);

  static Locale getLanguageCodeLocale() =>
      getLanguageCode() != null ? Locale(getLanguageCode()!) : Locale('sv');

  void changeLanguage(lang) {
    if (lang!.langCode !=
        getIt
            .get<SharedPreferencesManager>()
            .getString(SharedPreferenceKey.languageCode)) {
      SessionUtils.saveLanguageCode(lang!.langCode);
      S.load(Locale(lang.langCode));
      notifyListeners();
    }
  }

  static final languages = [
    CountryLangModel(langCode: "vi", langName: "Vietnamese"),
    CountryLangModel(langCode: "en", langName: "English"),
    CountryLangModel(langCode: "sv", langName: "Swedish"),
  ];

  static CountryLangModel getSelectedItem() => languages.firstWhere(
        (langModel) => langModel.langCode == getLanguageCode(),
        orElse: () => CountryLangModel(
          langCode: "sv",
          langName: "Swedish",
        ),
      );
}
