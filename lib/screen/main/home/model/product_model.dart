class HProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String prices;
  final String rating;
  final String imageUrl;
  final bool isFavorite;

  HProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.prices,
    required this.rating,
    required this.imageUrl,
    required this.isFavorite,
  });
}
