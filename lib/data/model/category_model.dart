class CategoryModel {
  final int status;
  final int? errorCode;
  final String? errors;
  final List<_Item>? items;

  CategoryModel({
    required this.status,
    this.errorCode,
    this.errors,
    this.items,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        errorCode: json["error_code"],
        errors: json["errors"],
        items: json["data"] == null
            ? null
            : List<_Item>.from(json["data"].map((x) => _Item.fromJson(x))),
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

class _Item {
  final String? id;
  final String? name;
  final String? icons;

  _Item({
    required this.id,
    required this.name,
    required this.icons,
  });

  factory _Item.fromJson(Map<String, dynamic> json) =>
      _Item(id: json["id"], name: json["name"], icons: json["icons"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "icons": icons};
}
