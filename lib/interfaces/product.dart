class Product {
  final String title;
  final String imagePath;
  final double price;
  final bool isBest;
  final String category;
  final double rating;
  final bool isNew;
  final String brand;
  final String size;
  final String color;
  int quantity;

  Product({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.isBest,
    required this.category,
    required this.rating,
    required this.isNew,
    required this.brand,
    required this.size,
    required this.color,
    this.quantity = 1, // Default quantity is 1
  });
}