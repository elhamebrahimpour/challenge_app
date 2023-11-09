import 'package:challenge_app/test1/bloc/favorite/favorite_bloc.dart';
import 'package:challenge_app/test1/ui/widgets/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoritePlaceList) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 42),
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      PlaceItem(state.places![index]),
                      const SizedBox(
                        height: 32,
                      ),
                      InkWell(
                        onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                            DeleteFromFavorites(state.places![index].title!)),
                        child: const Icon(Icons.delete,
                            color: Colors.red, size: 32),
                      ),
                    ],
                  );
                }),
                itemCount: state.places!.length,
              ),
            );
          }
          return const Center(child: Text('Error!'));
        },
      ),
    );
  }
}
