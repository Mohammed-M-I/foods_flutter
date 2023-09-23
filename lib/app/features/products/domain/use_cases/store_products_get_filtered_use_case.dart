import 'package:dartz/dartz.dart';
import 'package:foods_rouni/app/core/data/data_state.dart';
import 'package:foods_rouni/app/core/error/export_error.dart';
import 'package:foods_rouni/app/core/use_case/use_case.dart';

import '../entities/product.dart';
import '../repositories/products_repository.dart';

class StoreProductsGetFilteredUseCase extends UseCase<DataState<List<Product>>, Params> {
  final ProductsRepository _repository;

  StoreProductsGetFilteredUseCase({
    required ProductsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<Product>>>> call(Params params) {
    return _repository.getFiltered(
      pageSize: params.pageSize,
      pageNumber: params.pageNumber,
      search: params.search,
      withPaging: params.withPaging,
      categoryId: params.categoryId,
    );
  }
}

class Params {
  final int pageSize;
  final int pageNumber;
  final String search;
  final bool withPaging;
  final int categoryId;

  Params({
    required this.pageSize,
    required this.pageNumber,
    required this.search,
    required this.withPaging,
    required this.categoryId,
  });
}
