class Category {
  final int id;
  final String name;
  final String description;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  String toString() {
    return name;
  }
}
