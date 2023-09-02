import '../values/constants/app_urls.dart';

extension StringsExtension on String {
  String get toUrl => '${AppUrls.baseUrl}$this';

  String get toBearer => 'Bearer $this';
}
