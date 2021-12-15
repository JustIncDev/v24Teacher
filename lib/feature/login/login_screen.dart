import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v24_teacher_app/feature/signup/credentials/signup_credentials_screen.dart';
import 'package:v24_teacher_app/global/ui/button/primary_button.dart';
import 'package:v24_teacher_app/global/ui/button/social_button.dart';
import 'package:v24_teacher_app/global/ui/space.dart';
import 'package:v24_teacher_app/global/ui/text_field/app_text_field.dart';
import 'package:v24_teacher_app/global/ui/text_field/input_field_type.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';
import 'package:v24_teacher_app/res/icons.dart';
import 'package:v24_teacher_app/res/localization/id_values.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  var _passwordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _addLoginFieldInputEvent(InputFieldType.email, _emailController.text);
    });
    _passwordController.addListener(() {
      _addLoginFieldInputEvent(InputFieldType.password, _passwordController.text);
    });

    _emailFocusNode.addListener(() {
      _addLoginFieldValidateEvent(InputFieldType.email, _emailFocusNode);
    });
    _passwordFocusNode.addListener(() {
      _addLoginFieldValidateEvent(InputFieldType.password, _passwordFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const VerticalSpace(58.5),
                        Center(
                          child: Text(
                            getStringById(context, StringId.login),
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 18.0,
                              letterSpacing: -0.3,
                            ).montserrat(fontWeight: AppFonts.semiBold),
                          ),
                        ),
                        const VerticalSpace(55.5),
                        AppTextField(
                          labelText: getStringById(context, StringId.email),
                          hintText: 'example@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const VerticalSpace(18.0),
                        AppTextField(
                          labelText: getStringById(context, StringId.password),
                          obscureText: !_passwordVisible,
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
                        PrimaryButton(
                          titleId: StringId.login,
                          onPressed: () => VoidCallback,
                          // onPressed: state.isFillAllFields() ? () => BlocProvider.of<LoginBloc>(context).add(LoginPerformEvent()) : null,
                        ),
                        const VerticalSpace(35.0),
                        Row(
                          children: [
                            const Expanded(
                              child: const Divider(
                                color: AppColors.disabledColor,
                                thickness: 1.0,
                                endIndent: 20.0,
                              ),
                            ),
                            Text(
                              getStringById(context, StringId.or),
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 13.0,
                                letterSpacing: -0.3,
                              ).montserrat(fontWeight: AppFonts.regular),
                            ),
                            const Expanded(
                              child: const Divider(
                                color: AppColors.disabledColor,
                                thickness: 1.0,
                                indent: 20.0,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpace(28.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SocialButton(type: SocialMediaType.apple),
                            const SocialButton(type: SocialMediaType.facebook),
                            const SocialButton(type: SocialMediaType.google),
                          ],
                        ),
                        const Spacer(),
                        Center(
                          child: Text(
                            getStringById(context, StringId.noAccount),
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 13.0,
                              letterSpacing: -0.3,
                            ).montserrat(fontWeight: AppFonts.regular),
                          ),
                        ),
                        const VerticalSpace(10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push<void>(SignUpCredentialsScreen.route());
                          },
                          child: Text(
                            getStringById(context, StringId.register),
                            style: const TextStyle(
                              color: AppColors.royalBlue,
                              decoration: TextDecoration.underline,
                              fontSize: 13.0,
                              letterSpacing: -0.3,
                            ).montserrat(fontWeight: AppFonts.semiBold),
                          ),
                        ),
                        const VerticalSpace(8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _addLoginFieldInputEvent(InputFieldType field, String value) {
    BlocProvider.of<LoginBloc>(context).add(LoginFieldInputEvent(field: field, value: value));
  }

  void _addLoginFieldValidateEvent(InputFieldType field, FocusNode focusNode) {
    if (!focusNode.hasFocus) {
      BlocProvider.of<LoginBloc>(context).add(LoginFieldValidateEvent(field: field));
    }
  }

  void _updateController(LoginState state) {
    if (_passwordController.text != state.passwordValue) {
      _passwordController.text = state.passwordValue;
    }
  }
}
