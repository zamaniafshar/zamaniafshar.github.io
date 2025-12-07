import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fa')
  ];

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'As a Flutter developer with several years of experience in developing cross-platform applications, I am adept at creating user-friendly, high-performance apps. With a deep understanding of architectural principles, clean coding practices, and code optimization, I am skilled at working closely with diverse teams to drive the successful delivery of complex projects. My ability to effectively collaborate and communicate ensures that challenges are met with innovative solutions. Furthermore, my commitment to staying current with the latest trends and technologies in the Flutter ecosystem empowers me to deliver cutting-edge solutions.'**
  String get aboutDescription;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @aboutMeTitle.
  ///
  /// In en, this message translates to:
  /// **'Hello, I\'m Amin Zamani afshar'**
  String get aboutMeTitle;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @contactAddress.
  ///
  /// In en, this message translates to:
  /// **'Iran, Kerman, Baft'**
  String get contactAddress;

  /// No description provided for @contactComment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get contactComment;

  /// No description provided for @contactCommentHint.
  ///
  /// In en, this message translates to:
  /// **'Type Comment'**
  String get contactCommentHint;

  /// No description provided for @contactDescription.
  ///
  /// In en, this message translates to:
  /// **'Here you can let me know if you have any criticism, suggestion or problem, I\'m waiting to hear your voice or see your message.'**
  String get contactDescription;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get contactEmailHint;

  /// No description provided for @contactEmptyFormError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your {label}.'**
  String contactEmptyFormError(Object label);

  /// No description provided for @contactInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'You can get my contact information here and if you like, you can see the urls of my pages on social networks from the top of the page and find me there.'**
  String get contactInfoDescription;

  /// No description provided for @contactInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'What is your plan ? Call me'**
  String get contactInfoTitle;

  /// No description provided for @contactInvalidEmailFormError.
  ///
  /// In en, this message translates to:
  /// **'Please input a valid email.'**
  String get contactInvalidEmailFormError;

  /// No description provided for @contactMeButton.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get contactMeButton;

  /// No description provided for @contactName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get contactName;

  /// No description provided for @contactNameHint.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get contactNameHint;

  /// No description provided for @contactSendEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s Up?'**
  String get contactSendEmailTitle;

  /// No description provided for @contactSendMessageFailureTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to send message, please try again.'**
  String get contactSendMessageFailureTitle;

  /// No description provided for @contactSendMessageSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Message successfuly sent.'**
  String get contactSendMessageSuccessTitle;

  /// No description provided for @contactSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get contactSubject;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get contactTitle;

  /// No description provided for @desktopDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Desktop Development'**
  String get desktopDevelopment;

  /// No description provided for @desktopDevelopmentDescription.
  ///
  /// In en, this message translates to:
  /// **'As a desktop developer, I create feature-rich apps that run on various operating systems. Whether standalone or enterprise-level software, I design and build apps to meet your specific needs.'**
  String get desktopDevelopmentDescription;

  /// No description provided for @downloadResume.
  ///
  /// In en, this message translates to:
  /// **'Download Resume'**
  String get downloadResume;

  /// No description provided for @hireMe.
  ///
  /// In en, this message translates to:
  /// **'Hire Me'**
  String get hireMe;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @homeJobTitle.
  ///
  /// In en, this message translates to:
  /// **'A Flutter Developer'**
  String get homeJobTitle;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome I\'m'**
  String get homeWelcome;

  /// No description provided for @jobTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get jobTitle;

  /// No description provided for @languageNameEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageNameEnglish;

  /// No description provided for @languageNamePersian.
  ///
  /// In en, this message translates to:
  /// **'Persian'**
  String get languageNamePersian;

  /// No description provided for @languageSkills.
  ///
  /// In en, this message translates to:
  /// **'Language Skills'**
  String get languageSkills;

  /// No description provided for @languageSkillsDescription.
  ///
  /// In en, this message translates to:
  /// **'One of my hobbies is studying and learning languages. I try to be able to learn and use my favorite languages.'**
  String get languageSkillsDescription;

  /// No description provided for @mobileDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Mobile Development'**
  String get mobileDevelopment;

  /// No description provided for @mobileDevelopmentDescription.
  ///
  /// In en, this message translates to:
  /// **'With expertise in mobile development, I can create user-friendly apps for iOS and Android. Whether native or cross-platform, I build apps optimized for performance, security, and scalability.'**
  String get mobileDevelopmentDescription;

  /// No description provided for @myName.
  ///
  /// In en, this message translates to:
  /// **'Amin Zamani afshar'**
  String get myName;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'My Services'**
  String get services;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @skillsDescription.
  ///
  /// In en, this message translates to:
  /// **'Here you can see my skills, one of the fascinations of the computer world is the momentary changes of technologies, but I try to update my knowledge every day and experience new technologies.'**
  String get skillsDescription;

  /// No description provided for @webDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Web Development'**
  String get webDevelopment;

  /// No description provided for @webDevelopmentDescription.
  ///
  /// In en, this message translates to:
  /// **'I specialize in creating dynamic web applications tailored to your needs. Whether it\'s a simple web app or a complex solution, I can design and develop an application that meets your goals and user requirements.'**
  String get webDevelopmentDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
