abstract class ProductsUiEvent {
  factory ProductsUiEvent.getAll({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
    required int categoryId,
  }) = GetAllEvent;
}

class GetAllEvent implements ProductsUiEvent {
  final int pageSize;
  final int pageNumber;
  final String search;
  final bool withPaging;
  final int categoryId;

  GetAllEvent({
    required this.pageSize,
    required this.pageNumber,
    required this.search,
    required this.withPaging,
    required this.categoryId,
  });
}
