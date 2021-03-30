import 'package:dio/dio.dart';
import '../hive/hive_service.dart';
import '../../di/locator.dart';
import '../model/model.dart';

class NetService {
  final Dio _dio = Dio();
  final HiveService _hiveService = locator.get();
  final String _baseUrl = "http://api.darxonschool.uz/clintapi/";

  Future<ProductModel> getProduct() async {
    Response? response = await _request(path: "products", method: "GET");
    if (response != null) return ProductModel.fromJson(response.data);
    return ProductModel(status: 0, errors: "NULL");
  }

  Future<ProductModel> getProductByCategory(int categoryId) async {
    Response? response = await _request(
      path: "products/get-products-by-category-id?id=$categoryId",
      method: "GET",
    );
    if (response != null) return ProductModel.fromJson(response.data);
    return ProductModel(status: 0, errors: "NULL");
  }

  Future<CategoryModel> getCategory() async {
    Response? response = await _request(path: "category", method: "GET");
    if (response != null) return CategoryModel.fromJson(response.data);
    return CategoryModel(status: 0, errors: "NULL");
  }

  Future<CardModel> getCard() async {
    Response? response = await _request(path: "cart", method: "GET");
    if (response != null) return CardModel.fromJson(response.data);
    return CardModel(status: 1, errors: "NULL");
  }

  Future<String> auth() async {
    Response? response = await _request(
      path: "auth",
      method: "GET",
      headers: {"Authorization": await _hiveService.getId()},
    );
    if (response != null) {
      if (response.data["data"] == null) return "";
      final String token = response.data["data"]["access_token"];
      await _hiveService.setToken(token);
      return token;
    }
    return "";
  }

  Future<MessageModel> setRegion(int regionId) async {
    Response? response = await _request(
      path: "products/change-region?id=$regionId",
      method: "GET",
    );
    if (response != null) return MessageModel.fromJson(response.data);
    return MessageModel(status: 0, errors: "NULL");
  }

  Future<MessageModel> addCard(int productId) async {
    Response? response = await _request(
      path: "cart/add-cart",
      method: "POST",
      body: {"product_id": "$productId"},
    );
    if (response != null) return MessageModel.fromJson(response.data);
    return MessageModel(status: 0, errors: "NULL");
  }

  Future<MessageModel> removeCard(int productId) async {
    Response? response = await _request(
      path: "cart/remove-cart",
      method: "POST",
      body: {"product_id": "$productId"},
    );
    if (response != null) return MessageModel.fromJson(response.data);
    return MessageModel(status: 0, errors: "NULL");
  }

  Future<MessageModel> setOrder({
    required String recipient_fio,
    required String recipient_phone,
    required String delivery_address,
    required String delivery_date,
    required String delivey_time,
    required String descriptions,
    required String not_to_report,
    required String not_say_from_who,
    required String not_to_call,
  }) async {
    Response? response = await _request(
      path: "order",
      method: "POST",
      body: {
        "recipient_fio": recipient_fio,
        "recipient_phone": recipient_phone,
        "delivery_address": delivery_address,
        "delivery_date": delivery_date,
        "delivey_time": delivey_time,
        "descriptions": descriptions,
        "not_to_report": not_to_report,
        "not_say_from_who": not_say_from_who,
        "not_to_call": not_to_call,
      },
    );
    if (response != null) return MessageModel.fromJson(response.data);
    return MessageModel(status: 0, errors: "NULL");
  }

  Future<Response?> _request({
    required String path,
    required String method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final Map<String, dynamic> newHeaders = {
        "X-Access-Token": "${await _hiveService.getToken()}"
      };
      if (headers != null) newHeaders.addAll(headers);
      Response? response = await _dio.request(
        "$_baseUrl$path",
        data: body,
        options: Options(
          method: method,
          receiveTimeout: 60000,
          sendTimeout: 60000,
          headers: newHeaders,
          validateStatus: (status) => true,
        ),
      );
      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) return response;
      return null;
    } catch (e) {
      print("$_baseUrl$path\n$method\nxatolik: $e");
      return null;
    }
  }
}
