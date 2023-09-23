import '../../values/constants/app_constants.dart';

class PagedList {
  final int totalRecords;
  final int pageSize;
  final int pageNumber;
  final int firstPage;
  final int lastPage;
  final int previousPage;
  final int nextPage;
  final int totalPages;
  final int firstItem;
  final int lastItem;
  final bool withPaging;

  PagedList({
    required this.totalRecords,
    required this.pageSize,
    required this.pageNumber,
    required this.firstPage,
    required this.lastPage,
    required this.previousPage,
    required this.nextPage,
    required this.totalPages,
    required this.firstItem,
    required this.lastItem,
    required this.withPaging,
  });

  factory PagedList.defaultObj() => PagedList(
        totalRecords: -1,
        pageSize: AppConstants.defaultPageSize,
        pageNumber: 1,
        firstPage: -1,
        lastPage: -1,
        previousPage: -1,
        nextPage: -1,
        totalPages: -1,
        firstItem: -1,
        lastItem: -1,
        withPaging: true,
      );

  PagedList copyWith({
    int? pageSize,
    int? pageNumber,
    bool? withPaging,
  }) =>
      PagedList(
        totalRecords: totalRecords,
        pageSize: pageSize ?? this.pageSize,
        pageNumber: pageNumber ?? this.pageNumber,
        firstPage: firstPage,
        lastPage: lastPage,
        previousPage: previousPage,
        nextPage: nextPage,
        totalPages: totalPages,
        firstItem: firstItem,
        lastItem: lastItem,
        withPaging: withPaging ?? this.withPaging,
      );
}
