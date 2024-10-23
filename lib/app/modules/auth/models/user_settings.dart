import 'package:flutter/material.dart';

class UserSettings {
  String title;
  Icon icon;
  Widget? trailing;
  Function()? onTap;
  UserSettings({
    this.onTap,
    required this.title,
    required this.icon,
    this.trailing,
  });
}
