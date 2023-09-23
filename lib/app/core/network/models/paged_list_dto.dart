import 'dart:convert';

import '../../values/constants/app_constants.dart';
import 'paged_list.dart';

class PagedListDto extends PagedList {
  PagedListDto({
    required super.totalRecords,
    required super.pageSize,
    required super.pageNumber,
    required super.firstPage,
    required super.lastPage,
    required super.previousPage,
    required super.nextPage,
    required super.totalPages,
    required super.firstItem,
    required super.lastItem,
    required super.withPaging,
  });

  factory PagedListDto.defaultObj() => PagedListDto(
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

  PagedListDto copyWith({
    int? pageSize,
    int? pageNumber,
    bool? withPaging,
  }) =>
      PagedListDto(
        totalRecords: totalRecords,
        pageSize: pageSize ?? super.pageSize,
        pageNumber: pageNumber ?? super.pageNumber,
        firstPage: firstPage,
        lastPage: lastPage,
        previousPage: previousPage,
        nextPage: nextPage,
        totalPages: totalPages,
        firstItem: firstItem,
        lastItem: lastItem,
        withPaging: withPaging ?? super.withPaging,
      );

  factory PagedListDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      PagedListDto(
        totalRecords: json['totalRecords'],
        pageSize: json['pageSize'],
        pageNumber: json['pageNumber'],
        firstPage: json['firstPage'],
        lastPage: json['lastPage'],
        previousPage: json['previousPage'],
        nextPage: json['nextPage'],
        totalPages: json['totalPages'],
        firstItem: json['firstItem'],
        lastItem: json['lastItem'],
        withPaging: json['withPaging'],
      );

  Map<String, dynamic> toJson() => {
        'totalRecords': totalRecords,
        'pageSize': pageSize,
        'pageNumber': pageNumber,
        'firstPage': firstPage,
        'lastPage': lastPage,
        'previousPage': previousPage,
        'nextPage': nextPage,
        'totalPages': totalPages,
        'firstItem': firstItem,
        'lastItem': lastItem,
        'withPaging': withPaging,
      };

  @override
  String toString() => jsonEncode(
        toJson(),
      );
}
