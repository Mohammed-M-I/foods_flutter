import 'package:dartz/dartz.dart';
import 'package:foods_rouni/app/core/data/data_state.dart';
import 'package:foods_rouni/app/core/error/export_error.dart';

import '../entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, DataState<List<Product>>>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
    required int categoryId,
  });
}
