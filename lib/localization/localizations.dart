import 'package:flutter/material.dart';
import 'package:personal_website/data/models/app_localization_data.dart';

const kPersianLocale = Locale('fa', 'IR');
const kEnglishLocale = Locale('en', 'US');
const kLocalesList = [kEnglishLocale, kPersianLocale];

AppLocalizationData get englishLocalization => AppLocalizationData(
      locale: kEnglishLocale,
      myName: 'Mohammad Amin Zamani afshar',
      jobTitle: 'Flutter Developer',
      myLastName: 'Zamani.afshar',
      home: 'Home',
      aboutMe: 'About Me',
      skills: 'Skills',
      services: 'Services',
      contact: 'Contact',
    );

AppLocalizationData get persianLocalization => AppLocalizationData(
      locale: kPersianLocale,
      myName: 'محمد امین زمانی افشار',
      jobTitle: 'توسعه دهنده فلاتر',
      myLastName: 'زمانی.افشار',
      home: 'خانه',
      aboutMe: 'درباره من',
      skills: 'مهارت ها',
      services: 'خدمات',
      contact: 'ارتباط با من',
    );
