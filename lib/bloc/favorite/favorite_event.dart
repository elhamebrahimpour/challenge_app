part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class FavoriteLoadedEvent extends FavoriteEvent {}

class AddPlaceToFavorites extends FavoriteEvent {
  final Place place;
  AddPlaceToFavorites(this.place);
}

class DeleteFromFavorites extends FavoriteEvent {
  final String title;
  DeleteFromFavorites(this.title);
}
