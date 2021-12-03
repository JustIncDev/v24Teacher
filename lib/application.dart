import 'package:flutter/material.dart';
import 'package:v24_teacher_app/feature/splash/splash_screen.dart';
import 'package:v24_teacher_app/global/injector.dart';

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
      home: SplashScreen(),
      themeMode: ThemeMode.light,
    );
  }
}
