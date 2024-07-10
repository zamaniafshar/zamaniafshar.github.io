import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showSendMessageSuccessSnackbar(BuildContext context) {
  final localization = AppLocalizations.of(context)!;

  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    title: Text(localization.contactSendMessageSuccessTitle),
    alignment: Alignment.topLeft,
    autoCloseDuration: const Duration(seconds: 5),
  );
}

void showSendMessageFailureSnackbar(BuildContext context) {
  final localization = AppLocalizations.of(context)!;

  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    title: Text(localization.contactSendMessageFailureTitle),
    alignment: Alignment.topLeft,
    autoCloseDuration: const Duration(seconds: 4),
  );
}
