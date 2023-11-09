import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:challenge_app/test1/constants/utils/place_list.dart';
import 'package:challenge_app/test1/data/model/place.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeLoadedEvent>(_getAllPlaces);
  }

  FutureOr<void> _getAllPlaces(HomeLoadedEvent event, Emitter<HomeState> emit) {
    try {
      final List<Place> getAllPlaces = getPlaceList();
      emit(HomeLoadingPlace(getAllPlaces));
    } catch (e) {
      emit(
        HomeErrorState(e.toString()),
      );
    }
  }
}
