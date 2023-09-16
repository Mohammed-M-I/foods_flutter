import 'package:foods_rouni/app/core/data/remote_data_state.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_provider.dart';
import '../../../../core/network/models/network_response.dart';
import '../../../../core/values/constants/app_urls.dart';
import '../../../auth/core/utils/auth_user_utils.dart';
import '../models/remote/category_dto.dart';

abstract class CategoriesRemoteDatasource {
  Future<RemoteDataState<List<CategoryDto>?>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  });
}

class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  @override
  Future<RemoteDataState<List<CategoryDto>?>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  }) async {
    List<CategoryDto>? dataList;
    PagedList? pagedList;

    await ApiProvider.get(
      url: AppUrls.storeCategoriesGetFiltered(
        pageSize: pageSize,
        pageNumber: pageNumber,
        search: search,
        withPaging: withPaging,
      ),
      token: AuthUserUtils.token,
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<CategoryDto>(
          data,
          CategoryDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        dataList = networkResponse.dataList ?? [];
        pagedList = networkResponse.pagedList;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return RemoteDataState.done(
      data: dataList,
      pagedList: pagedList,
    );
  }
}
