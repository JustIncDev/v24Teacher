import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:v24_teacher_app/feature/login/login_screen.dart';
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
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localizationsDelegates: [
        const TextResourceDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: LoginScreen(),
      // themeMode: ThemeMode.dark,
      // builder: (context, child) {
      // return BlocListener<AuthenticationBloc, AuthenticationState>(
      //   listener: (context, state) {
      //     switch (state.status) {
      //       case AuthenticationStatus.authenticated:
      //         _navigator.pushAndRemoveUntil<void>(
      //           HomePage.route(),
      //           (route) => false,
      //         );
      //         break;
      //       case AuthenticationStatus.unauthenticated:
      //         _navigator.pushAndRemoveUntil<void>(
      //           LoginPage.route(),
      //           (route) => false,
      //         );
      //         break;
      //       default:
      //         break;
      //     }
      //   },
      //   child: child,
      // );
      // },
      onGenerateRoute: (_) => LoginScreen.route(),
    );
  }
}
