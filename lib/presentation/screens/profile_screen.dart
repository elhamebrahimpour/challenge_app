import 'package:challenge_app/const/utilities.dart';
import 'package:challenge_app/presentation/widgets/profile_appbar.dart';
import 'package:challenge_app/presentation/widgets/setting_item.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple[800],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(26),
          ),
        ),
        title: const Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              size: 22,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Edit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(180.0),
          child: AppBarBottomView(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
          ),
          child: ListView.builder(
            itemCount: Utils.getSettingItems().length,
            itemBuilder: (context, index) {
              return ProfileSettingItems(
                settingModel: Utils.getSettingItems()[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
