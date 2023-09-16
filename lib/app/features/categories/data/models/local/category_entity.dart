import '../../../domain/entities/category.dart';

class CategoryEntity extends Category {
  CategoryEntity({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory CategoryEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      CategoryEntity(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'image': image,
      };

  @override
  String toString() {
    return name;
  }
}
