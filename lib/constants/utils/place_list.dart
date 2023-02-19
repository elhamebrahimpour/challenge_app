import 'package:challenge_app/data/model/place.dart';

List<Place> getPlaceList() {
  var placeOne = Place(
    'The Grand Canyon',
    'wavy-sea.jpg',
    60,
  );
  var placeTwo = Place(
    'Bali Tourism',
    'rock-state-park.jpg',
    145,
  );
  var placeThree = Place(
    'Tropical Green Forest',
    'tropical-green-forest.jpg',
    210,
  );
  return [placeOne, placeTwo, placeThree];
}

List<Place> getFavoriteList({List<Place>? list}) {
  List<Place> favoriteList = list!;
  return favoriteList;
}
