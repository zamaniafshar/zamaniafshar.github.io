import 'package:hive/hive.dart';

const _languageCodeKey = 'code';

class LanguageDatabase {
  late Box _languageBox;

  Future<void> init() async {
    _languageBox = await Hive.openBox('language');
  }

  void saveLanguage(String languageCode) {
    _languageBox.put(_languageCodeKey, languageCode);
  }

  String? getLanguage() {
    return _languageBox.get(_languageCodeKey);
  }
}
