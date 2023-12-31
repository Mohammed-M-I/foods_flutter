import 'dart:ui';

import 'package:get/get.dart';

import '../storage/app_storage.dart';
import 'from/ar_sa_translations.dart';
import 'from/en_gb_translations.dart';

class AppTranslations extends Translations {
  //region Languages Keys

  static const String arabicLang = 'ar';
  static const String arabicCountry = 'SA';
  static const String arabicLocale = '${arabicLang}_$arabicCountry'; // 'ar_SA'

  static const String englishLang = 'en';
  static const String englishCountry = 'GB';
  static const String englishLocale = '${englishLang}_$englishCountry'; // 'en_GB'

  //endregion

  @override
  Map<String, Map<String, String>> get keys => {
    arabicLocale: arSA,
    englishLocale: enGB,
  };

  static Locale getAppLocale() {
    final String locale = AppStorage.read(
      AppStorage.locale,
      englishLocale,
    );

    return _getLocale(
      locale,
    );
  }

  static Future<void> changeLocale(
      String locale,
      ) async {
    await AppStorage.write(
      AppStorage.locale,
      locale,
    );

    // For Settings switch
    final lang = locale.split('_').first;
    if (lang == arabicLang) {
      await AppStorage.write(
        AppStorage.isRTL,
        true,
      );
    } else {
      await AppStorage.write(
        AppStorage.isRTL,
        false,
      );
    }

    return Get.updateLocale(
      _getLocale(
        locale,
      ),
    );
  }

  // Utils
  static Locale _getLocale(String locale) {
    return Locale.fromSubtags(
      scriptCode: '_',
      languageCode: locale.split('_').first,
      countryCode: locale.split('_').last,
    );
  }
}
