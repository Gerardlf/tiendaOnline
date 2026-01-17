class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final double rating;
  final int ratingCount;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final ratingJson = json["rating"] as Map<String, dynamic>?;
    return Product(
      id: json["id"] as int,
      title: json["title"] as String,
      price: (json["price"] as num).toDouble(),
      description: json["description"] as String,
      category: json["category"] as String,
      imageUrl: json["image"] as String,
      rating: ratingJson != null ? (ratingJson["rate"] as num).toDouble() : 0.0,
      ratingCount: ratingJson != null ? (ratingJson["count"] as int) : 0,
    );
  }
}
