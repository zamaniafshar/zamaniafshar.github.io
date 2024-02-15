final class FormValidator {
  static final _emailValidationRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static bool isEmpty(String? text) => text == null || text.isEmpty;
  static bool isInvalidEmail(String? text) => !_emailValidationRegex.hasMatch(text ?? '');
}
