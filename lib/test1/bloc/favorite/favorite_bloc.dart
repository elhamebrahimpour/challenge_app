import 'package:bloc/bloc.dart';
import 'package:challenge_app/test1/constants/utils/place_list.dart';
import 'package:challenge_app/test1/data/model/place.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitialState()) {
    List<Place>? placeList;
    on<AddPlaceToFavorites>(
      ((event, emit) {
        placeList = getFavoriteList(list: [event.place]);
        emit(FavoritePlaceList(placeList!));
      }),
    );

    on<FavoriteLoadedEvent>(
      (event, emit) => emit(FavoritePlaceList(placeList!)),
    );

    on<DeleteFromFavorites>((event, emit) {
      placeList?.removeWhere(
        (element) => element.title == event.title,
      );
      emit(FavoritePlaceList(placeList!));
    });
  }
}
