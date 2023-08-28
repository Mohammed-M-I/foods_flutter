import 'package:flutter/material.dart';
import 'app/core/utils/app_network_utils.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

Future<void> main() async {
  // For check internet connection
  AppNetworkUtilsImpl.init();

  // Init GetStorage
  await GetStorage.init();

  runApp(
    const App(),
  );
}
