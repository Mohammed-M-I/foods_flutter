import '../../../data/models/remote/product_dto.dart';
import '../product.dart';

extension ProductDtoExtensions on ProductDto {
  Product get toDomain => Product(
        id: id,
        name: name,
        description: description,
        image: image,
        price: price,
        storeName: storeName,
      );
}

extension ListProductDtoExtensions on List<ProductDto> {
  List<Product> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
