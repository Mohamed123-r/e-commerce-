class ProductEntity {
  final String id;

  final String name;
  final String description;

  final String imageUrl;

  final num price;
  final num stock;
  final num weight;
  final String color;
  final num rating;
  final num reviewsCount;

  ProductEntity({
    required this.stock,
    required  this.weight,
    required  this.color,
    required this.rating,
    required this.reviewsCount,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
