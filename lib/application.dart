import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:v24_teacher_app/feature/login/login_screen.dart';
import 'package:v24_teacher_app/feature/signup/credentials/signup_credentials_screen.dart';
import 'package:v24_teacher_app/feature/signup/sms_code/phone_confirmation_screen.dart';
import 'package:v24_teacher_app/global/injector.dart';
import 'package:v24_teacher_app/res/localization/app_localization.dart';

class V24TeacherApplication extends StatefulWidget {
  const V24TeacherApplication({
    Key? key,
    required this.injector,
  }) : super(key: key);

  final Injector injector;

  @override
  _V24TeacherApplicationState createState() => _V24TeacherApplicationState();
}

class _V24TeacherApplicationState extends State<V24TeacherApplication> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        const TextResourceDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: SignUpCredentialsScreen(),
      themeMode: ThemeMode.dark,
    );
  }
}
