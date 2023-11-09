import 'package:flutter/material.dart';

class AppBarBottomView extends StatelessWidget {
  const AppBarBottomView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
            Positioned(
              bottom: -3,
              child: Container(
                height: 26,
                color: Colors.transparent,
                child: const Icon(
                  Icons.add_a_photo,
                  size: 24,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'elham',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '914*******',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
