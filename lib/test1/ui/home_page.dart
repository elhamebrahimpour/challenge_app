import 'package:challenge_app/test1/bloc/favorite/favorite_bloc.dart';
import 'package:challenge_app/test1/bloc/home/home_bloc.dart';
import 'package:challenge_app/test1/constants/custom_color.dart';
import 'package:challenge_app/test1/ui/widgets/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int badgeNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _GetHomePageHeader(badgeNumber),
            //home page main content
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'Place arround you',
                            style: TextStyle(
                              color: CustomColors.blackColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'View All',
                            style: TextStyle(
                              color: CustomColors.darkGrey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //show place items
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoadingPlace) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<FavoriteBloc>(context).add(
                                    AddPlaceToFavorites(state.places![index]),
                                  );
                                  setState(() {
                                    badgeNumber = badgeNumber + 1;
                                  });
                                },
                                child: PlaceItem(state.places![index]),
                              );
                            }),
                            childCount: state.places!.length,
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(
                        child: Text('Error!'),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GetHomePageHeader extends StatelessWidget {
  const _GetHomePageHeader(this.badgeNumber, {Key? key}) : super(key: key);
  final int badgeNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.50,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.lightBlue,
            CustomColors.darkBlue,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //get menu and favorite icons
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/images/icon_menu.png'),
                ),
                const Spacer(),
                /*Badge(
                  badgeContent: Text(
                    '$badgeNumber',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((_) => BlocProvider.value(
                                  value: BlocProvider.of<HomeBloc>(context),
                                  child: const FavoritePage(),
                                )),
                          ),
                        );
                      },
                      child: Image.asset('assets/images/icon_favorite.png'),
                    ),
                  ),
                ),*/
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            //get categories title
            _getCategoryList(),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Travel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'around the world.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            //get search container
            _getSearchBox()
          ],
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white38,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Image.asset('assets/images/icon_location.png'),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your destinations ...',
                hintStyle: TextStyle(
                  color: CustomColors.lightGrey,
                ),
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCategoryList() {
    int selectedItemIndex = 0;
    final List<String> categoryItems = [
      'Trending',
      'Featured',
      'New',
    ];
    return SizedBox(
      height: 31,
      child: ListView.builder(
        itemCount: categoryItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: selectedItemIndex == index
                    ? Colors.white12
                    : Colors.transparent),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  categoryItems[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: CustomColors.lightGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
