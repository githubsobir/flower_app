import 'dart:math';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../model/model.dart';

class HiveService {
  late Box _box;

  Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init("${dir.path}/fl");
    _box = await Hive.openBox("tmp");
  }

  Future<void> setProduct(ProductModel model) async =>
      await _box.put("${_HiveKeys.PRODUCT}", model.toJson());

  Future<ProductModel?> getProduct() async {
    final json = await _box.get("${_HiveKeys.PRODUCT}");
    if (json != null) return ProductModel.fromJson(json);
    return null;
  }

  Future<void> setCategory(CategoryModel model) async =>
      await _box.put("${_HiveKeys.CATEGORY}", model.toJson());

  Future<CategoryModel?> getCategory() async {
    final json = await _box.get("${_HiveKeys.CATEGORY}");
    if (json != null) return CategoryModel.fromJson(json);
    return null;
  }

  Future<void> setCard(CardModel model) async =>
      await _box.put("${_HiveKeys.CARD}", model.toJson());

  Future<CardModel?> getCard() async {
    final json = await _box.get("${_HiveKeys.CARD}");
    if (json != null) return CardModel.fromJson(json);
    return null;
  }

  Future<void> setMessage(MessageModel model) async =>
      await _box.put("${_HiveKeys.MESSAGE}", model.toJson());

  Future<MessageModel?> getMessage() async {
    final json = await _box.get("${_HiveKeys.MESSAGE}");
    if (json != null) return MessageModel.fromJson(json);
    return null;
  }

  Future<void> setToken(String token) async =>
      await _box.put("${_HiveKeys.TOKEN}", token);

  Future<String?> getToken() async => await _box.get("${_HiveKeys.TOKEN}");

  Future<void> setId(String id) async => await _box.put("${_HiveKeys.ID}", id);

  Future<String?> getId() async {
    String? id = await _box.get("${_HiveKeys.ID}");
    if (id != null) return id;

    String newId = "";
    for (int i = 0; i < 14; i++) newId += "${Random().nextInt(10)}";
    await _box.put("${_HiveKeys.ID}", newId);
    return newId;
  }

  Future<void> addFavorite(int productId) async =>
      await _box.add(FavoriteModel(productId: productId).toJson());

  Future<List<FavoriteModel>> getFavorites() async {
    final List<FavoriteModel> list = [];
    for (int i = 0; i < _box.length; i++)
      list.add(FavoriteModel.fromJson(await _box.getAt(i)));
    return list;
  }

  Future<void> clear() async => await _box.clear();
}

enum _HiveKeys { PRODUCT, CATEGORY, CARD, MESSAGE, TOKEN, ID }
