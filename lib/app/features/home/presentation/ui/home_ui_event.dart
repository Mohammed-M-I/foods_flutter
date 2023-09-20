abstract class HomeUiEvent {
  factory HomeUiEvent.getCategories({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  }) = GetCategoriesEvent;
}

class GetCategoriesEvent implements HomeUiEvent {
  final int pageSize;
  final int pageNumber;
  final String search;
  final bool withPaging;

  GetCategoriesEvent({
    required this.pageSize,
    required this.pageNumber,
    required this.search,
    required this.withPaging,
  });
}
