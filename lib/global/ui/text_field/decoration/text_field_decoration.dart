import 'package:flutter/material.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';

class TextFieldDecoration extends StatelessWidget {
  const TextFieldDecoration({
    Key? key,
    required this.child,
    this.labelText,
  }) : super(key: key);

  final Widget child;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelDecorationWidget(labelText: labelText),
        child,
      ],
    );
  }
}

class _LabelDecorationWidget extends StatelessWidget {
  const _LabelDecorationWidget({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        labelText ?? '',
        textAlign: TextAlign.start,
        style: const TextStyle(color: AppColors.royalBlue, fontSize: 13.0)
            .montserrat(fontWeight: AppFonts.semiBold),
      ),
    );
  }
}
