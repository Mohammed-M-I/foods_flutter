import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/app_storage.dart';
import '../models/local/category_entity.dart';

abstract class CategoriesLocalDatasource {
  Future<void> storeAll({
    required List<CategoryEntity> dataList,
  });

  Future<List<CategoryEntity>> getAll();
}

class CategoriesLocalDatasourceImpl implements CategoriesLocalDatasource {
  static const String _dataListKey = 'CategoriesDataList';

  @override
  Future<void> storeAll({
    required List<CategoryEntity> dataList,
  }) async {
    try {
      await AppStorage.write(
        _dataListKey,
        dataList,
      );
    } on Exception catch (exception) {
      throw LocalException(
        message: exception.toString(),
      );
    }
  }

  @override
  Future<List<CategoryEntity>> getAll() async {
    final List<CategoryEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => CategoryEntity.fromJson(
          element,
        ),
      )
          .toList();

      return dataList;
    } on Exception catch (exception) {
      throw LocalException(
        message: exception.toString(),
      );
    }
  }
}
