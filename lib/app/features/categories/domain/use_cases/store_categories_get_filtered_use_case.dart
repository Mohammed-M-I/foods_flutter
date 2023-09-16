import 'package:dartz/dartz.dart';

import '../../../../core/data/data_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/category.dart';
import '../repositories/categories_repository.dart';

class StoreCategoriesGetFilteredUseCase extends UseCase<DataState<List<Category>>, Params> {
  final CategoriesRepository _repository;

  StoreCategoriesGetFilteredUseCase({
    required CategoriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<Category>>>> call(Params params) {
    return _repository.getFiltered(
      pageSize: params.pageSize,
      pageNumber: params.pageNumber,
      search: params.search,
      withPaging: params.withPaging,
    );
  }
}

class Params {
  final int pageSize;
  final int pageNumber;
  final String search;
  final bool withPaging;

  Params({
    required this.pageSize,
    required this.pageNumber,
    required this.search,
    required this.withPaging,
  });
}
