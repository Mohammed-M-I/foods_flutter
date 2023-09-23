import 'dart:convert';

import 'paged_list_dto.dart';

class NetworkResponseDto<T> {
  final bool succeeded;
  final String key;
  final String message;
  final PagedListDto? pagedList;
  final T? data;
  final List<T>? dataList;

  NetworkResponseDto({
    required this.succeeded,
    required this.key,
    required this.message,
    required this.pagedList,
    required this.data,
    required this.dataList,
  });

  static NetworkResponseDto<T> fromJson<T>(
    Map<String, dynamic> json, [
    T Function(Map<String, dynamic> json)? fromJsonT,
  ]) =>
      NetworkResponseDto(
        succeeded: json['succeeded'],
        key: json['key'] ?? '',
        message: json['message'] ?? '',
        pagedList: json['pagedList'] == null
            ? null
            : PagedListDto.fromJson(
                json['pagedList'],
              ),
        data: _getData<T>(
          json,
          fromJsonT,
        ),
        dataList: _getDataList<T>(
          json,
          fromJsonT,
        ),
      );

  static T? _getData<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
  ) {
    if (fromJsonT == null) {
      return null;
    }

    if (json['data'] == null) {
      return null;
    }

    if (json['data'] is Map) {
      return fromJsonT(
        json['data'],
      );
    }

    return null;
  }

  static List<T>? _getDataList<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
  ) {
    if (fromJsonT == null) {
      return null;
    }

    if (json['data'] == null) {
      return null;
    }

    if (json['data'] is List) {
      return (json['data'] as List)
          .map(
            (element) => fromJsonT(
              element,
            ),
          )
          .toList();
    }

    return null;
  }
}
