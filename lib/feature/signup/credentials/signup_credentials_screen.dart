import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v24_teacher_app/feature/login/login_screen.dart';
import 'package:v24_teacher_app/global/ui/button/primary_button.dart';
import 'package:v24_teacher_app/global/ui/button/social_button.dart';
import 'package:v24_teacher_app/global/ui/space.dart';
import 'package:v24_teacher_app/global/ui/text_field/app_text_field.dart';
import 'package:v24_teacher_app/global/ui/text_field/number_text_field.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';
import 'package:v24_teacher_app/res/icons.dart';
import 'package:v24_teacher_app/res/localization/id_values.dart';

class SignUpCredentialsScreen extends StatefulWidget {
  const SignUpCredentialsScreen({Key? key}) : super(key: key);

  @override
  _SignUpCredentialsScreenState createState() => _SignUpCredentialsScreenState();

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpCredentialsScreen());
  }
}

class _SignUpCredentialsScreenState extends State<SignUpCredentialsScreen> {
  @override
  Widget build(BuildContext context) {
    var _passwordVisible = false;

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
                            getStringById(context, StringId.registration),
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 18.0,
                              letterSpacing: -0.3,
                            ).montserrat(fontWeight: AppFonts.semiBold),
                          ),
                        ),
                        const VerticalSpace(34.5),
                        Row(
                          children: [
                            Expanded(
                              child: AppTextField(
                                labelText: getStringById(context, StringId.firstName),
                              ),
                            ),
                            const HorizontalSpace(18.0),
                            Expanded(
                              child: AppTextField(
                                labelText: getStringById(context, StringId.lastName),
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpace(18.0),
                        AppTextField(
                          labelText: getStringById(context, StringId.email),
                          hintText: 'example@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const VerticalSpace(18.0),
                        PhoneNumberTextField(
                          labelText: getStringById(context, StringId.phoneNumber),
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
                        const VerticalSpace(18.0),
                        AppTextField(
                          labelText: getStringById(context, StringId.confirmPassword),
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
                          titleId: StringId.finish,
                          onPressed: () => VoidCallback,
                          // onPressed: state.isFillAllFields() ? () => BlocProvider.of<LoginBloc>(context).add(LoginPerformEvent()) : null,
                        ),
                        const Spacer(),
                        const VerticalSpace(28.0),
                        Center(
                          child: Text(
                            getStringById(context, StringId.alreadyHaveMessage),
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
                            Navigator.of(context).push<void>(LoginScreen.route());
                          },
                          child: Text(
                            getStringById(context, StringId.signIn),
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
}
