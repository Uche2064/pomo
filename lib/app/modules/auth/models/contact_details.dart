import 'package:flutter/material.dart';

class ContactDetails {
  IconData leadingIconData;
  String title;
  String subtitle;
  void Function()? onTap;

  ContactDetails(
      {required this.leadingIconData,
      required this.title,
      required this.subtitle,
      this.onTap});
}
