import 'package:challenge_app/data/model/model.dart';
import 'package:flutter/material.dart';

class Utils {
  static List<SettingModel> getSettingItems() {
    return [
      SettingModel(
        Icons.password,
        'Password',
        arrowIcon: Icons.arrow_forward_ios,
      ),
      SettingModel(
        Icons.email,
        'Email Address',
        arrowIcon: Icons.arrow_forward_ios,
      ),
      SettingModel(
        Icons.fingerprint,
        'Fingerprint',
        arrowIcon: Icons.arrow_forward_ios,
      ),
      SettingModel(
        Icons.support,
        'Support',
      ),
      SettingModel(
        Icons.exit_to_app,
        'Sign Out',
      )
    ];
  }
}

