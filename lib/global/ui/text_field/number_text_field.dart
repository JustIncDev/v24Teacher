import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:v24_teacher_app/global/ui/text_field/decoration/text_field_decoration.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    Key? key,
    this.labelText,
    this.borderRadius = 8.0,
  }) : super(key: key);

  final String? labelText;
  final double borderRadius;

  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldDecoration(
      labelText: widget.labelText,
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber value) {},
        selectorConfig: const SelectorConfig(
          useEmoji: true,
          showFlags: true,
          selectorType: PhoneInputSelectorType.DROPDOWN,
          setSelectorButtonAsPrefixIcon: true,
        ),
        inputDecoration: InputDecoration(
          counterText: '',
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 14.5, bottom: 14.5, left: 20.0, right: 14.0),
          filled: false,
          alignLabelWithHint: true,
          errorMaxLines: 1,
          // errorStyle: const TextStyle(fontSize: 0, height: 0),
          hintStyle: TextStyle(color: AppColors.black.withOpacity(0.4), fontSize: 13.0)
              .montserrat(fontWeight: AppFonts.regular),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: AppColors.disabledColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: AppColors.accent50),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: AppColors.accent),
          ),
        ),
        ignoreBlank: true,
        autoValidateMode: AutovalidateMode.disabled,
        hintText: '000-000-000',
        spaceBetweenSelectorAndTextField: 10.0,
      ),
    );
  }
}
