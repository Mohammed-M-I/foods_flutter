import 'package:dartz/dartz.dart';

import '../../../../core/data/data_state.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/utils/app_network_utils.dart';
import '../../../categories/domain/entities/mappers/category_mappers.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';
import '../datasources/categories_local_datasource.dart';
import '../datasources/categories_remote_datasource.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource _remoteDatasource;
  final CategoriesLocalDatasource _localDatasource;

  CategoriesRepositoryImpl({
    required CategoriesRemoteDatasource remoteDatasource,
    required CategoriesLocalDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<Category>>>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getFiltered(
          pageSize: pageSize,
          pageNumber: pageNumber,
          search: search,
          withPaging: withPaging,
        );

        // Store locally without paging
        await _localDatasource.storeAll(
          dataList: result!.dataDto!.toEntityList,
        );

        return Right(
          DataState.done(
            data: result!.dataDto!.toDomainList,
          ),
        );
      }

      // Not connected to internet, get dataList from local
      final localDataList = await _localDatasource.getAll();
      if (localDataList.isNotEmpty) {
        return Right(
          DataState.done(
            data: localDataList.toDomainList,
            failure: NoInternetConnectionFailure(),
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
