import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hint,
    required this.validator,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.expanded = false,
    this.controller,
  });

  final String title;
  final String hint;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool expanded;
  final String? Function(String? text) validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget textFormFiled = TextFormField(
      controller: controller,
      cursorColor: theme.primaryColor,
      expands: expanded,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.top,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.primaryColor,
          ),
        ),
      ),
    );

    if (expanded) {
      textFormFiled = Expanded(child: textFormFiled);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 10),
        textFormFiled,
      ],
    );
  }
}
