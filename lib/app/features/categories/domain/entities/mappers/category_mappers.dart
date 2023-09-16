import '../../../data/models/local/category_entity.dart';
import '../../../data/models/remote/category_dto.dart';
import '../category.dart';

extension CategoryDtoExtensions on CategoryDto {
  Category get toDomain => Category(
        id: id,
        name: name,
        description: description,
        image: image,
      );

  CategoryEntity get toEntity => CategoryEntity(
    id: id,
    name: name,
    description: description,
    image: image,
  );

}

extension CategoryEntityExtensions on CategoryEntity {
  Category get toDomain => Category(
    id: id,
    name: name,
    description: description,
    image: image,
  );
}


extension ListCategoryDtoExtensions on List<CategoryDto> {
  List<Category> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<CategoryEntity> get toEntityList => map(
        (element) => element.toEntity,
  ).toList();
}


extension ListCategoryEntityExtensions on List<CategoryEntity> {
  List<Category> get toDomainList => map(
        (element) => element.toDomain,
  ).toList();
}
