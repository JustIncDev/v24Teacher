import 'package:flutter/material.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';
import 'package:v24_teacher_app/res/localization/id_values.dart';

enum PrimaryButtonStyle {
  standard,
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.titleId,
    this.titleText,
    this.style = PrimaryButtonStyle.standard,
    this.elevation = 0.0,
    this.child,
    this.disabledColor,
    this.backgroundColor,
    this.borderSide,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final StringId? titleId;
  final String? titleText;
  final PrimaryButtonStyle style;
  final double elevation;
  final Widget? child;
  final Color? disabledColor;
  final Color? backgroundColor;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return _getDisabledColor();
          }
          return _getColor(); // Defer to the widget's default.
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return _getDisabledTextColor();
          }
          return _getTextColor(); // Defer to the widget's default.
        }),
        shadowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return AppColors.shadowColor.withOpacity(0.2);
        }),
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            side: borderSide ?? BorderSide.none,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.pressed) ? _getOverlayColor() : null;
          },
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: _getGradientColor(),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Text(
          titleId != null ? getStringById(context, titleId!) : titleText ?? '',
          style: const TextStyle(fontSize: 13).montserrat(fontWeight: AppFonts.semiBold),
        ),
      ),
    );
  }

  Gradient _getGradientColor() {
    switch (style) {
      case PrimaryButtonStyle.standard:
        return const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.sixteenMillionPink,
            AppColors.hooloovooBlue,
            AppColors.blueRaspberry,
          ],
        );
    }
  }

  Color _getColor() {
    if (backgroundColor != null) {
      return backgroundColor!;
    }
    switch (style) {
      case PrimaryButtonStyle.standard:
        return AppColors.transparent;
    }
  }

  Color _getTextColor() {
    switch (style) {
      case PrimaryButtonStyle.standard:
        return AppColors.white;
    }
  }

  Color _getDisabledColor() {
    var disabledColor = this.disabledColor;
    if (disabledColor != null) {
      return disabledColor;
    }
    switch (style) {
      case PrimaryButtonStyle.standard:
        return AppColors.disabledColor;
    }
  }

  Color _getDisabledTextColor() {
    switch (style) {
      case PrimaryButtonStyle.standard:
        return AppColors.royalBlue;
    }
  }

  Color _getOverlayColor() {
    switch (style) {
      case PrimaryButtonStyle.standard:
        return AppColors.white10;
    }
  }
}
