import 'package:flutter/material.dart';

class AppLocalizationData {
  AppLocalizationData({
    required this.locale,
    required this.myName,
    required this.jobTitle,
    required this.myLastName,
    required this.home,
    required this.aboutMe,
    required this.skills,
    required this.services,
    required this.contact,
  });

  final Locale locale;

  // Home Screen
  final String myName;
  final String jobTitle;
  final String myLastName;

  final String home;
  final String aboutMe;
  final String skills;
  final String services;
  final String contact;
}
