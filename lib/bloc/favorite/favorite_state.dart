part of 'favorite_bloc.dart';

abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoritePlaceList extends FavoriteState {
  final List<Place>? places;
  FavoritePlaceList(this.places);
}
