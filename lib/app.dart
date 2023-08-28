import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/themes/app_themes.dart';
import 'app/core/translations/app_translations.dart';
import 'app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Routing
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,

      // Theme
      theme: AppThemes.getAppTheme(),
      darkTheme: AppThemes.getAppDarkTheme(),
      themeMode: AppThemes.getAppThemeMode(),

      // Locale
      locale: AppTranslations.getAppLocale(),
      translations: AppTranslations(),
    );
  }
}
