import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fl_app/data/hive/hive_service.dart';
import 'package:fl_app/data/model/model.dart';
import 'package:fl_app/data/net/net_service.dart';
import 'package:fl_app/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../model/model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;

  final HiveService _hive = locator.get();
  final NetService _net = locator.get();

  HomeBloc(this.context) : super(InitialState());
  late CategoryModel _categoryModel;
  late ProductModel _productModel;
  final List<HRegionModel> _regionList = [];
  final List<HCategoryModel> _categoryList = [];
  final List<HProductModel> _productList = [];

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LaunchEvent)
      yield* _eventLaunch(event);
    else if (event is SelectCategoryEvent)
      yield* _eventSelectCategory(event);
    else if (event is ItemEvent)
      yield* _eventItem(event);
    else if (event is FavoriteEvent)
      yield* _eventFavorite(event);
    else if (event is BuyEvent) yield* _eventBuy(event);
  }

  Stream<HomeState> _eventLaunch(HomeEvent event) async* {
    yield LoadingState();
    _categoryModel = (await _hive.getCategory())!;
    _productModel = (await _hive.getProduct())!;
    _regionList.add(HRegionModel(id: 1, name: "Toshkent", selected: true));
    _regionList.add(HRegionModel(id: 2, name: "Buxoro", selected: false));
    for (int i = 0; i < _categoryModel.items!.length; i++)
      _categoryList.add(
        HCategoryModel(
          id: _categoryModel.items![i].id!,
          name: _categoryModel.items![i].name!,
          selected: i == 0,
        ),
      );
    _productModel.items!.forEach((it) {
      _productList.add(HProductModel(
        id: it.id ?? "0",
        categoryId: it.categoriesId ?? "0",
        name: it.name ?? "",
        prices: it.prices ?? "",
        rating: it.reytingBalls ?? "3+",
        imageUrl: it.imageUrl ?? "",
        isFavorite: false,
      ));
    });
    yield SuccessState(
      regionList: _regionList,
      categoryList: _categoryList,
      productList: _productList,
      categoryTitle: "All Products",
    );
  }

  Stream<HomeState> _eventSelectCategory(SelectCategoryEvent event) async* {
    for (int i = 0; i < _categoryList.length; i++)
      _categoryList[i].selected = false;
    _categoryList[event.index].selected = true;
    final List<HProductModel> productList = [];
    _productList.forEach((it) {
      if (it.categoryId == _categoryList[event.index].id) productList.add(it);
    });
    yield SuccessState(
      regionList: _regionList,
      categoryList: _categoryList,
      productList: productList,
      categoryTitle: productList.isNotEmpty ? "All Products" : "No Products",
    );
  }

  Stream<HomeState> _eventItem(ItemEvent event) async* {}

  Stream<HomeState> _eventFavorite(FavoriteEvent event) async* {}

  Stream<HomeState> _eventBuy(BuyEvent event) async* {}
}
