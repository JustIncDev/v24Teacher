import 'package:flutter/cupertino.dart';

import 'app_localization.dart';

enum StringId {
  login,
  email,
  password,
  or,
  noAccount,
  register,
  registration,
  firstName,
  lastName,
  phoneNumber,
  continueText,
  alreadyHaveMessage,
  signIn,
  confirmPassword,
  finish,
  firstNameEmptyError,
  lastNameEmptyError,
  phoneEmptyError,
  emailEmptyError,
  passwordEmptyError,
  passwordLengthError,
  phoneConfirmation,
  enterCodeMessage,
  changePhone,
  resendCode,
}

class ForIdValues {
  ForIdValues(this.locale);

  final Locale locale;

  static final Map<String, Map<StringId, String>> _localizedValues = {
    'en': {
      StringId.login: 'Login',
      StringId.email: 'Email',
      StringId.password: 'Password',
      StringId.or: 'or',
      StringId.noAccount: 'No account yet?',
      StringId.register: 'Register',
      StringId.registration: 'Registration',
      StringId.firstName: 'First name',
      StringId.lastName: 'Last name',
      StringId.phoneNumber: 'Phone number',
      StringId.continueText: 'Continue',
      StringId.alreadyHaveMessage: 'Already have an account?',
      StringId.signIn: 'Sign in',
      StringId.confirmPassword: 'Confirm password',
      StringId.finish: 'Finish',
      StringId.firstNameEmptyError: 'First name is required',
      StringId.lastNameEmptyError: 'Last name is required',
      StringId.emailEmptyError: 'Email is required',
      StringId.phoneEmptyError: 'Phone is required',
      StringId.passwordEmptyError: 'Password is required',
      StringId.passwordLengthError: 'Password should contain 8 to 35 characters',
      StringId.phoneConfirmation: 'Phone confirmation',
      StringId.enterCodeMessage: 'Please enter the verification code that was sent to ',
      StringId.changePhone: 'Change phone',
      StringId.resendCode: 'Resend code',
    }
  };

  String? getValue(StringId id) {
    return _localizedValues[locale.languageCode]?[id];
  }
}

String getStringById(BuildContext context, StringId id) {
  return TextResource.of(context)?.forIdValues.getValue(id) ?? '';
}

String getStringWithValues(BuildContext context, StringId stringId, List<String> args) {
  var res = getStringById(context, stringId);
  for (var i = 0; i < args.length; i++) {
    res = res.replaceAll('<${i + 1}>', args[i]);
  }
  return res;
}
