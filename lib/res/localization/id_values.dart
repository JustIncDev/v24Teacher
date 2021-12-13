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
    }
  };

  String? getValue(StringId id) {
    return _localizedValues[locale.languageCode]?[id];
  }
}

String getStringById(BuildContext context, StringId id) {
  return TextResource.of(context)?.forIdValues.getValue(id) ?? '';
}
