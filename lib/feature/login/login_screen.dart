import 'package:flutter/material.dart';
import 'package:v24_teacher_app/global/ui/button/primary_button.dart';
import 'package:v24_teacher_app/global/ui/space.dart';
import 'package:v24_teacher_app/global/ui/text_field/app_text_field.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';
import 'package:v24_teacher_app/res/icons.dart';
import 'package:v24_teacher_app/res/localization/id_values.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      getStringById(context, StringId.login),
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 18.0,
                        letterSpacing: -0.3,
                      ).montserrat(fontWeight: AppFonts.semiBold),
                    ),
                    const VerticalSpace(34.0),
                    AppTextField(
                      labelText: getStringById(context, StringId.email),
                      hintText: 'example@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const VerticalSpace(18.0),
                    AppTextField(
                      labelText: getStringById(context, StringId.password),
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: !_passwordVisible
                            ? const Image(
                                image: AppIcons.eyeOpenAsset,
                                color: AppColors.borderColor,
                              )
                            : const Image(
                                image: AppIcons.eyeCloseAsset,
                                color: AppColors.borderColor,
                              ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    const VerticalSpace(28.0),
                    const PrimaryButton(
                      titleId: StringId.login,
                      // onPressed: state.isFillAllFields() ? () => BlocProvider.of<LoginBloc>(context).add(LoginPerformEvent()) : null,
                    ),
                    const VerticalSpace(35.0),
                    Row(
                      children: [
                        const Divider(color: AppColors.disabledColor),
                        const HorizontalSpace(20.0),
                        Text(
                          getStringById(context, StringId.or),
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 13.0,
                            letterSpacing: -0.3,
                          ).montserrat(fontWeight: AppFonts.regular),
                        ),
                        const HorizontalSpace(20.0),
                        const Divider(color: AppColors.disabledColor),
                      ],
                    ),
                    const VerticalSpace(28.0),
                    Row(
                      children: [

                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
