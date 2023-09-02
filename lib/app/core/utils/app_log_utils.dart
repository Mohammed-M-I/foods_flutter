import 'package:flutter/foundation.dart';

class AppLogUtils {
  static void logInfo({
    required String message,
  }) {
    if (kDebugMode) {
      print(
        message,
      );
    }
  }
}
