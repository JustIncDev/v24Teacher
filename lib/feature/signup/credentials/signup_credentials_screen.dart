import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v24_teacher_app/global/bloc.dart';
import 'package:v24_teacher_app/global/navigation/root_router.dart';
import 'package:v24_teacher_app/global/navigation/screen_info.dart';
import 'package:v24_teacher_app/global/ui/button/primary_button.dart';
import 'package:v24_teacher_app/global/ui/progress/progress_wall.dart';
import 'package:v24_teacher_app/global/ui/space.dart';
import 'package:v24_teacher_app/global/ui/text_field/app_text_field.dart';
import 'package:v24_teacher_app/global/ui/text_field/input_field_type.dart';
import 'package:v24_teacher_app/global/ui/text_field/number_text_field.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';
import 'package:v24_teacher_app/res/icons.dart';
import 'package:v24_teacher_app/res/localization/id_values.dart';
import 'package:v24_teacher_app/utils/ui.dart';

import 'bloc/signup_credentials_bloc.dart';

class SignUpCredentialsScreen extends StatefulWidget {
  const SignUpCredentialsScreen({Key? key}) : super(key: key);

  @override
  _SignUpCredentialsScreenState createState() => _SignUpCredentialsScreenState();

  static Page buildPage({Map<String, Object>? params, required BlocFactory blocFactory}) {
    return UiUtils.createPlatformPage(
      key: const ValueKey('signup-credentials'),
      child: BlocProvider(
        create: (ctx) {
          return blocFactory.createSignUpCredentialsBloc();
        },
        child: const SignUpCredentialsScreen(),
        lazy: false,
      ),
    );
  }
}

class _SignUpCredentialsScreenState extends State<SignUpCredentialsScreen> {
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    firstNameController
        .addListener(() => _listenInputField(InputFieldType.firstName, firstNameController.text));

    lastNameController
        .addListener(() => _listenInputField(InputFieldType.lastName, lastNameController.text));

    phoneController
        .addListener(() => _listenInputField(InputFieldType.phone, phoneController.text));

    emailController
        .addListener(() => _listenInputField(InputFieldType.email, emailController.text));

    passwordController
        .addListener(() => _listenInputField(InputFieldType.password, passwordController.text));

    confirmPasswordController.addListener(
        () => _listenInputField(InputFieldType.confirmPassword, confirmPasswordController.text));

    firstNameFocusNode.addListener(
        () => _changeFieldCursorPosition(firstNameFocusNode, InputFieldType.firstName));

    lastNameFocusNode
        .addListener(() => _changeFieldCursorPosition(lastNameFocusNode, InputFieldType.lastName));

    phoneFocusNode
        .addListener(() => _changeFieldCursorPosition(phoneFocusNode, InputFieldType.phone));

    emailFocusNode
        .addListener(() => _changeFieldCursorPosition(emailFocusNode, InputFieldType.email));

    passwordFocusNode
        .addListener(() => _changeFieldCursorPosition(passwordFocusNode, InputFieldType.password));

    confirmPasswordFocusNode.addListener(
        () => _changeFieldCursorPosition(confirmPasswordFocusNode, InputFieldType.confirmPassword));
  }

  @override
  void dispose() {
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _passwordVisible = false;
    var _confirmPasswordVisible = false;

    return BlocConsumer<SignUpCredentialsBloc, SignUpCredentialsState>(
      listener: (context, state) {
        if (state.status == BaseScreenStatus.next) {
          // RootRouter.of(context)
          //     ?.push(ScreenInfo(name: ScreenName.signUpCode, params: {'token': state.verificationToken, 'phone': state.phoneValue}));
          return;
        }
        FocusNode? needFocus;
        TextEditingController? needController;
        if (!state.firstNameError.isNone()) {
          needFocus = firstNameFocusNode;
          needController = firstNameController;
        } else if (!state.lastNameError.isNone()) {
          needFocus = lastNameFocusNode;
          needController = lastNameController;
        } else if (!state.phoneError.isNone()) {
          needFocus = phoneFocusNode;
          needController = phoneController;
        } else if (!state.emailError.isNone()) {
          needFocus = emailFocusNode;
          needController = emailController;
        } else if (!state.passwordError.isNone()) {
          needFocus = passwordFocusNode;
          needController = passwordController;
        } else if (!state.confirmError.isNone()) {
          needFocus = confirmPasswordFocusNode;
          needController = confirmPasswordController;
        }
        if (needFocus != null && !needFocus.hasFocus) {
          needController?.selection =
              TextSelection.fromPosition(TextPosition(offset: needController.text.length));
          needFocus.requestFocus();
        }
      },
      builder: (context, state) {
        _updateController(state);
        return Stack(
          children: [
            Scaffold(
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
                                        controller: firstNameController,
                                        focusNode: firstNameFocusNode,
                                        labelText: getStringById(context, StringId.firstName),
                                        errorText: state.firstNameError.getMessage(context),
                                      ),
                                    ),
                                    const HorizontalSpace(18.0),
                                    Expanded(
                                      child: AppTextField(
                                        controller: lastNameController,
                                        focusNode: lastNameFocusNode,
                                        labelText: getStringById(context, StringId.lastName),
                                        errorText: state.lastNameError.getMessage(context),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalSpace(18.0),
                                AppTextField(
                                  controller: emailController,
                                  focusNode: emailFocusNode,
                                  labelText: getStringById(context, StringId.email),
                                  hintText: 'example@gmail.com',
                                  errorText: state.emailError.getMessage(context),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const VerticalSpace(18.0),
                                PhoneNumberTextField(
                                  controller: phoneController,
                                  focusNode: phoneFocusNode,
                                  labelText: getStringById(context, StringId.phoneNumber),
                                  errorText: state.phoneError.getMessage(context),
                                ),
                                const VerticalSpace(18.0),
                                AppTextField(
                                  controller: passwordController,
                                  focusNode: passwordFocusNode,
                                  labelText: getStringById(context, StringId.password),
                                  errorText: state.passwordError.getMessage(context),
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
                                      // setState(() {
                                      //   _passwordVisible = !_passwordVisible;
                                      // });
                                    },
                                  ),
                                ),
                                const VerticalSpace(18.0),
                                AppTextField(
                                  controller: confirmPasswordController,
                                  focusNode: confirmPasswordFocusNode,
                                  labelText: getStringById(context, StringId.confirmPassword),
                                  errorText: state.confirmError.getMessage(context),
                                  obscureText: !_confirmPasswordVisible,
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
                                      // setState(() {
                                      //   _confirmPasswordVisible = !_confirmPasswordVisible;
                                      // });
                                    },
                                  ),
                                ),
                                const VerticalSpace(28.0),
                                PrimaryButton(
                                  titleId: StringId.finish,
                                  onPressed: state.isFillAllFields() ? () => BlocProvider.of<SignUpCredentialsBloc>(context).add(SignUpPerformEvent()) : null,
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
                                    RootRouter.of(context)
                                        ?.first(const ScreenInfo(name: ScreenName.login));
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
            ),
            state.status == BaseScreenStatus.lock ? const ProgressWall() : const Offstage(),
          ],
        );
      },
    );
  }

  void _changeFieldCursorPosition(FocusNode focusNode, InputFieldType field) {
    if (!focusNode.hasFocus) {
      BlocProvider.of<SignUpCredentialsBloc>(context).add(SignUpFieldValidateEvent(field: field));
    }
  }

  void _listenInputField(InputFieldType field, String value) {
    BlocProvider.of<SignUpCredentialsBloc>(context)
        .add(SignUpFieldInputEvent(field: field, value: value));
  }

  void _updateController(SignUpCredentialsState state) {
    if (firstNameController.text != state.firstNameValue) {
      firstNameController.text = state.firstNameValue;
    }
    if (lastNameController.text != state.lastNameValue) {
      lastNameController.text = state.lastNameValue;
    }
    if (phoneController.text != state.phoneValue) {
      phoneController.text = state.phoneValue;
    }
    if (emailController.text != state.emailValue) {
      emailController.text = state.emailValue;
    }
    if (passwordController.text != state.passwordValue) {
      passwordController.text = state.passwordValue;
    }
    if (confirmPasswordController.text != state.confirmValue) {
      confirmPasswordController.text = state.confirmValue;
    }
  }
}
