import '../../../domain/entities/product.dart';

class ProductDto extends Product {
  ProductDto({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
    required super.storeName,
  });

  factory ProductDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProductDto(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
        storeName: json['storeName'],
      );
}
