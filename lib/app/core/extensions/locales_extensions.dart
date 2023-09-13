import 'dart:ui';

extension StringsExtension on Locale {
  String get toServerCulture => '${languageCode}_${countryCode ?? ''}';
}
