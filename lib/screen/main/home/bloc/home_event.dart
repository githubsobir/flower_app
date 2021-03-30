part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LaunchEvent extends HomeEvent {}

class SelectCategoryEvent extends HomeEvent {
  final int index;

  SelectCategoryEvent({required this.index});
}

class FavoriteEvent extends HomeEvent {
  final int index;

  FavoriteEvent({required this.index});
}

class BuyEvent extends HomeEvent {
  final int index;

  BuyEvent({required this.index});
}

class ItemEvent extends HomeEvent {
  final int index;

  ItemEvent({required this.index});
}
