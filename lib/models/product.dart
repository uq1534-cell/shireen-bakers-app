class Category {
  final String id;
  final String name;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

class Product {
  final String id;
  final String name;
  final String categoryId;
  final double price; // in PKR
  final String imageUrl;
  final String description;
  final double weight; // in grams
  final bool isAvailable;

  const Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.weight = 0,
    this.isAvailable = true,
  });
}
