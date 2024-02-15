import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/data/message_sender_api.dart';
import 'package:personal_website/provider/message_sender_provider.dart';
import 'package:personal_website/ui/home/widgets/contact_me/form_validator.dart';
import 'package:personal_website/ui/home/widgets/contact_me/widgets/custom_text_form_field.dart';
import 'package:personal_website/ui/home/widgets/contact_me/widgets/send_message_snack_bars.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';

class SendMessage extends HookConsumerWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final screen = Screen.of(context);

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final fullNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final subjectController = useTextEditingController();
    final commentController = useTextEditingController();

    ref.listen(messageSenderProvider, (_, next) {
      if (next == SendMessageStatus.success) {
        showSendMessageSuccessSnackbar(context);
        fullNameController.clear();
        emailController.clear();
        subjectController.clear();
        commentController.clear();
      } else if (next == SendMessageStatus.failed) {
        showSendMessageFailureSnackbar(context);
      }
    });

    Widget child;
    final textFields = [
      CustomTextFormField(
        title: localization.contactName,
        hint: localization.contactNameHint,
        controller: fullNameController,
      ),
      CustomTextFormField(
        title: localization.contactEmail,
        hint: localization.contactEmailHint,
        controller: emailController,
        validator: (text) {
          if (FormValidator.isInvalidEmail(text)) {
            return localization.contactInvalidEmailFormError;
          }
          return null;
        },
      ),
      CustomTextFormField(
        title: localization.contactSubject,
        hint: localization.contactSubject,
        controller: subjectController,
      ),
    ];

    final isSmallScreen = screen.type.isMobile;

    final commentTextField = CustomTextFormField(
      title: localization.contactComment,
      hint: localization.contactCommentHint,
      controller: commentController,
      expanded: !isSmallScreen,
      minLines: isSmallScreen ? 10 : null,
      maxLines: isSmallScreen ? 15 : null,
      maxLength: 2000,
    );

    if (isSmallScreen) {
      child = Column(
        children: [
          ...textFields,
          commentTextField,
        ]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: e,
              ),
            )
            .toList(),
      );
    } else {
      child = Expanded(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: textFields,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: commentTextField,
              ),
            ],
          ),
        ),
      );
    }
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: screen.type.isMobile ? null : 580,
        width: double.infinity,
      ),
      child: Form(
        key: formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.contactSendEmailTitle,
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                child,
                const SizedBox(height: 30),
                Consumer(
                  builder: (context, ref, _) {
                    final sendMessageStatus = ref.watch(messageSenderProvider);

                    return CustomElevatedButton(
                      width: double.infinity,
                      height: 30,
                      gradientBackground: LinearGradient(
                        colors: [
                          theme.primaryColorLight,
                          theme.primaryColorDark,
                        ],
                      ),
                      onPressed: () {
                        final isInvalid = !formKey.currentState!.validate();
                        if (isInvalid) return;

                        final request = SendMessageRequest(
                          fullName: fullNameController.text,
                          subject: subjectController.text,
                          email: emailController.text,
                          comment: commentController.text,
                        );

                        ref.read(messageSenderProvider.notifier).send(request);
                      },
                      child: switch (sendMessageStatus) {
                        SendMessageStatus.loading => SizedBox.square(
                            dimension: 25,
                            child: CircularProgressIndicator(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        _ => Text(localization.contactMeButton),
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
