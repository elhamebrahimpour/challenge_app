import 'package:challenge_app/constants/custom_color.dart';
import 'package:challenge_app/data/model/place.dart';
import 'package:flutter/material.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem(this.place, {Key? key}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          _getPlaceDetails(),
          const SizedBox(
            height: 12,
          ),
          //review box
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color.fromARGB(255, 227, 227, 227),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getReviewOptionsRow('History, Cultural'),
                _getReviewOptionsRow('2 Tours in Asia'),
                _getReviewOptionsRow('3 person'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPlaceDetails() {
    return Row(
      children: [
        //place image
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            height: 120,
            width: 120,
            'assets/images/${place.image}',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        //place title and etc.
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              place.title!,
              style: const TextStyle(
                color: CustomColors.blackColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 32,
              width: 100,
              child: Image.asset('assets/images/icon_rating.jpg'),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Start Form',
              style: TextStyle(
                color: Color.fromARGB(255, 118, 118, 118),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '\$${place.price}',
                  style: const TextStyle(
                    color: CustomColors.priceColor,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  '/person',
                  style: TextStyle(
                    color: CustomColors.darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _getReviewOptionsRow(String title) {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 86, 86, 86),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: const TextStyle(
            color: CustomColors.darkGrey,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
