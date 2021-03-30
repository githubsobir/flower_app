part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  final List<HRegionModel> regionList;
  final List<HCategoryModel> categoryList;
  final List<HProductModel> productList;
  final String categoryTitle;

  SuccessState({
    required this.regionList,
    required this.categoryList,
    required this.productList,
    required this.categoryTitle,
  });
}

class FailState extends HomeState {
  final String message;

  FailState({required this.message});
}
