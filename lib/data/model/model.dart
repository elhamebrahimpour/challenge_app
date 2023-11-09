import 'package:flutter/material.dart';

class SettingModel {
  IconData icon;
  String title;
  IconData? arrowIcon;

  SettingModel(
    this.icon,
    this.title, {
    this.arrowIcon,
  });
}
