import 'package:challenge_app/data/model/model.dart';
import 'package:flutter/material.dart';

class ProfileSettingItems extends StatelessWidget {
  final SettingModel settingModel;
  const ProfileSettingItems({
    required this.settingModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              settingModel.icon,
              color: Colors.purple[800]!,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            settingModel.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[900]!,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Icon(
            settingModel.arrowIcon,
            size: 20,
            color: Colors.purple[800]!,
          ),
        ],
      ),
    );
  }
}
