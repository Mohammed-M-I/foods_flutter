import 'package:foods_rouni/AppSecrets.dart';

abstract class AppUrls {
  static const String baseUrl = AppSecrets.baseUrl;

  //region Accounts

  static String login() => '/api/MobAccounts/Login';

  static String register() => '/api/MobAccounts/Register';

  //endregion Accounts

//region Categories

  static String storeCategoriesGetFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  }) =>
      '/api/MobStoreCategories/GetFiltered?'
          'pageSize=$pageSize&'
          'pageNumber=$pageNumber&'
          'search=$search&'
          'withPaging=$withPaging';

//endregion Categories

//region Products

  static String storeProductsGetFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
    required int categoryId,
  }) =>
      '/api/MobStoresProducts/GetFiltered?'
          'pageSize=$pageSize&'
          'pageNumber=$pageNumber&'
          'search=$search&'
          'withPaging=$withPaging&'
          'storeId=0&'
          'categoryId=$categoryId';

//endregion Products
}
