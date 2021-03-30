class ProductModel {
  final int status;
  final int? errorCode;
  final String? errors;
  final List<_Items>? items;

  ProductModel({required this.status, this.errorCode, this.errors, this.items});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        errorCode: json["error_code"],
        errors: json["errors"],
        items: json["data"] == null
            ? null
            : List<_Items>.from(json["data"].map((x) => _Items.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error_code": errorCode,
        "errors": errors,
        "data": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class _Items {
  final String? id;
  final String? name;
  final String? structure;
  final String? height;
  final String? descriptions;
  final String? sellersId;
  final String? productStatusesId;
  final String? prices;
  final String? viewsCnt;
  final String? soldCnt;
  final String? categoriesId;
  final String? subcategoriesId;
  final String? reytingBalls;
  final String? reytingCnt;
  final String? imageUrl;
  final String? size;
  final String? cntFlora;
  final String? recommendation;
  final List<_Image>? images;

  _Items({
    required this.id,
    required this.name,
    required this.structure,
    required this.height,
    required this.descriptions,
    required this.sellersId,
    required this.productStatusesId,
    required this.prices,
    required this.viewsCnt,
    required this.soldCnt,
    required this.categoriesId,
    required this.subcategoriesId,
    required this.reytingBalls,
    required this.reytingCnt,
    required this.imageUrl,
    required this.size,
    required this.cntFlora,
    required this.recommendation,
    required this.images,
  });

  factory _Items.fromJson(Map<String, dynamic> json) {
    String imageUrl = "${json["image_url"]}";
    if (!imageUrl.contains("http"))
      imageUrl = "http://api.darxonschool.uz/img/$imageUrl";
    return _Items(
      id: json["id"],
      name: json["name"],
      structure: json["structure"],
      height: json["height"],
      descriptions: json["descriptions"],
      sellersId: json["sellers_id"],
      productStatusesId: json["product_statuses_id"],
      prices: json["prices"],
      viewsCnt: json["views_cnt"],
      soldCnt: json["sold_cnt"],
      categoriesId: json["categories_id"],
      subcategoriesId: json["subcategories_id"],
      reytingBalls: json["reyting_balls"],
      reytingCnt: json["reyting_cnt"],
      imageUrl: imageUrl,
      size: json["size"],
      cntFlora: json["cnt_flora"],
      recommendation: json["recommendation"],
      images: json["images"] == null
          ? null
          : List<_Image>.from(json["images"].map((x) => _Image.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "structure": structure,
        "height": height,
        "descriptions": descriptions,
        "sellers_id": sellersId,
        "product_statuses_id": productStatusesId,
        "prices": prices,
        "views_cnt": viewsCnt,
        "sold_cnt": soldCnt,
        "categories_id": categoriesId,
        "subcategories_id": subcategoriesId,
        "reyting_balls": reytingBalls,
        "reyting_cnt": reytingCnt,
        "image_url": imageUrl,
        "size": size,
        "cnt_flora": cntFlora,
        "recommendation": recommendation,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class _Image {
  final String? id;
  final String? productsId;
  final String? url;
  final String? sortId;

  _Image({
    required this.id,
    required this.productsId,
    required this.url,
    required this.sortId,
  });

  factory _Image.fromJson(Map<String, dynamic> json) {
    String imageUrl = "${json["url"]}";
    if (!imageUrl.contains("http"))
      imageUrl = "http://api.darxonschool.uz/img/$imageUrl";
    return _Image(
      id: json["id"],
      productsId: json["products_id"],
      url: imageUrl,
      sortId: json["sort_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "products_id": productsId,
        "url": url,
        "sort_id": sortId,
      };
}
