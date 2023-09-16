import 'package:dartz/dartz.dart';

import '../../../../core/data/data_state.dart';
import '../../../../core/error/failures.dart';
import '../entities/category.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, DataState<List<Category>>>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  });
}
