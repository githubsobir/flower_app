class MessageModel {
  final int status;
  final int? errorCode;
  final String? errors;
  final List<String>? items;

  MessageModel({required this.status, this.errorCode, this.errors, this.items});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        status: json["status"],
        errorCode: json["error_code"],
        errors: json["errors"],
        items: json["data"] == null
            ? null
            : List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error_code": errorCode,
        "errors": errors,
        "data": items == null ? null : List<dynamic>.from(items!.map((x) => x)),
      };
}
