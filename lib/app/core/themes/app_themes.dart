import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../storage/app_storage.dart';

abstract class AppThemes {
  //region Languages Keys

  static const String theme01 = "theme01";
  static const String theme02 = "theme02";

  // static const String customTheme = "customTheme";

  //endregion

  static final ThemeData _darkDefault = ThemeData.dark();
  static final ThemeData _lightDefault = ThemeData.light();

  static final ThemeData _darkTheme01 = ThemeData.dark();
  static final ThemeData _lightTheme01 = ThemeData.light();

  static final ThemeData _darkTheme02 = ThemeData.dark();
  static final ThemeData _lightTheme02 = ThemeData.light();

  static final ThemeData _customTheme = ThemeData(
    primaryColorDark: Colors.orange,
    primaryColor: Colors.orange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.red,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.redAccent,
      elevation: 0,
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Colors.orange,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    ),
  );

  // Keys [theme01, theme02]
  static void changeTheme({
    required String theme,
    required bool isDarkMode,
  }) async {
    await AppStorage.write(
      AppStorage.theme,
      theme,
    );

    await AppStorage.write(
      AppStorage.isDarkMode,
      isDarkMode,
    );

    final ThemeData themeData = _getThemeData(
      theme: theme,
      isDarkMode: isDarkMode,
    );

    Get.changeTheme(
      themeData,
    );

    Get.changeThemeMode(
      getAppThemeMode(),
    );
  }

  static ThemeData getAppTheme() {
    final theme = AppStorage.read<String>(
      AppStorage.theme,
      theme01,
    );

    return _getThemeData(
      theme: theme,
      isDarkMode: false,
    );
  }

  static ThemeData getAppDarkTheme() {
    final theme = AppStorage.read<String>(
      AppStorage.theme,
      theme01,
    );

    return _getThemeData(
      theme: theme,
      isDarkMode: true,
    );
  }

  static ThemeMode getAppThemeMode() {
    final isDarkMode = AppStorage.read<bool>(
      AppStorage.isDarkMode,
      false,
    );

    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static ThemeData _getThemeData({
    required String theme,
    required bool isDarkMode,
  }) {
    final ThemeData themeData;

    if (isDarkMode) {
      if (theme == theme01) {
        themeData = _darkTheme01;
      } else if (theme == theme02) {
        themeData = _darkTheme02;
      } else {
        themeData = _darkDefault;
      }
    } else {
      if (theme == theme01) {
        themeData = _lightTheme01;
      } else if (theme == theme02) {
        themeData = _lightTheme02;
      } else {
        themeData = _lightDefault;
      }
    }

    return themeData;
  }
}
