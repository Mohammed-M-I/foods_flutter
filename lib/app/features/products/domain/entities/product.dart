class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final int price;
  final String storeName;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.storeName,
  });

  @override
  String toString() {
    return name;
  }
}
