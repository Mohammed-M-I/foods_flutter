
import '../network/models/network_response_dto.dart';

import '../error/failures.dart';
import '../network/models/paged_list_dto.dart';

abstract class RemoteDataState<T> {
  final T dataDto;
  final PagedListDto? pagedListDto;

  const RemoteDataState._({
    required this.dataDto,
    this.pagedListDto,
  });

  factory RemoteDataState.done({
    required T dataDto,
    PagedListDto? pagedListDto,
  }) = RemoteDoneState<T>;
}

class RemoteDoneState<T> extends RemoteDataState<T> {
  const RemoteDoneState({
    required T dataDto,
    PagedListDto? pagedListDto,
  }) : super._(
    dataDto: dataDto,
      pagedListDto: pagedListDto,
  );
}
