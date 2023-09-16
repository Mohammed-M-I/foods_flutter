import '../../../domain/entities/category.dart';

class CategoryDto extends Category {
  CategoryDto({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory CategoryDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      CategoryDto(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
      );
}
