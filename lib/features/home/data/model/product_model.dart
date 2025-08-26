import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  /// Factory for parsing JSON object
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: (json['id'] as num).toInt(),
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
    category: json['category'] as String,
    image: json['image'] as String,
    rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
  );

  ProductEntity toProductEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating.toRatingEntity(),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: (json['rate'] as num).toDouble(),
    count: (json['count'] as num).toInt(),
  );

  RatingEntity toRatingEntity() {
    return RatingEntity(rate: rate, count: count);
  }
}
