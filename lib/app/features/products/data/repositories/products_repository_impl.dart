import 'package:dartz/dartz.dart';
import 'package:foods_rouni/app/core/data/data_state.dart';
import 'package:foods_rouni/app/core/error/export_error.dart';
import 'package:foods_rouni/app/core/network/utils/app_network_utils.dart';
import 'package:foods_rouni/app/features/products/domain/entities/mappers/product_mappers.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_datasource.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDatasource _remoteDatasource;

  ProductsRepositoryImpl({
    required ProductsRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, DataState<List<Product>>>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
    required int categoryId,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getFiltered(
          pageSize: pageSize,
          pageNumber: pageNumber,
          search: search,
          withPaging: withPaging,
          categoryId: categoryId,
        );

        return Right(
          DataState.done(
            data: result.dataDto!.toDomainList,
            pagedList: result.pagedListDto,
          ),
        );
      }

      return Left(
        NoInternetConnectionFailure(),
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
