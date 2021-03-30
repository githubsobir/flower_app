class FavoriteModel {
  final int productId;

  FavoriteModel({required this.productId});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      FavoriteModel(productId: json["productId"]);

  Map<String, dynamic> toJson() => {"productId": productId};
}
