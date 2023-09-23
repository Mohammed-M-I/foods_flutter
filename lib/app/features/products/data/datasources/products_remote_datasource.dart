
import 'package:foods_rouni/app/core/data/remote_data_state.dart';
import 'package:foods_rouni/app/core/error/exceptions.dart';
import 'package:foods_rouni/app/core/network/api_provider.dart';
import 'package:foods_rouni/app/core/network/models/network_response_dto.dart';
import 'package:foods_rouni/app/core/network/models/paged_list_dto.dart';
import 'package:foods_rouni/app/core/values/constants/app_urls.dart';
import 'package:foods_rouni/app/features/auth/core/utils/auth_user_utils.dart';

import '../models/remote/product_dto.dart';

abstract class ProductsRemoteDatasource {
  Future<RemoteDataState<List<ProductDto>?>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
    required int categoryId,
  });
}

class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  @override
  Future<RemoteDataState<List<ProductDto>?>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
    required int categoryId,
  }) async {
    List<ProductDto>? dataList;
    PagedListDto? pagedList;

    await ApiProvider.get(
      url: AppUrls.storeProductsGetFiltered(
        pageSize: pageSize,
        pageNumber: pageNumber,
        search: search,
        withPaging: withPaging,
        categoryId: categoryId,
      ),
      token: AuthUserUtils.token,
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponseDto.fromJson<ProductDto>(
          data,
          ProductDto.fromJson,
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
      dataDto: dataList,
      pagedListDto: pagedList,
    );
  }
}
