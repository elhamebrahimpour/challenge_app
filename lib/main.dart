import 'package:challenge_app/bloc/favorite/favorite_bloc.dart';
import 'package:challenge_app/bloc/home/home_bloc.dart';
import 'package:challenge_app/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(HomeLoadedEvent()),
        ),
        BlocProvider<FavoriteBloc>(
          create: (context) => FavoriteBloc()..add(FavoriteLoadedEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
