part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingPlace extends HomeState {
  final List<Place>? places;
  HomeLoadingPlace(this.places);
}

class FavoritePlaceList extends HomeState {
  final List<Place> places;
  FavoritePlaceList(this.places);
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}
