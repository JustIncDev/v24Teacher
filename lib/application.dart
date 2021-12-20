import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:v24_teacher_app/feature/login/login_screen.dart';
import 'package:v24_teacher_app/global/bloc.dart';
import 'package:v24_teacher_app/global/data_blocs/auth/auth_bloc.dart';
import 'package:v24_teacher_app/global/injector.dart';
import 'package:v24_teacher_app/global/navigation/screen_info.dart';
import 'package:v24_teacher_app/global/ui/defocuser.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/localization/app_localization.dart';

import 'global/navigation/root_router.dart';

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
  GlobalKey? providerKey;

  @override
  void initState() {
    super.initState();
    providerKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => widget.injector.authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        buildWhen: (previous, current) => previous.active != current.active,
        listenWhen: (oldState, newState) => oldState.active != newState.active,
        builder: (context, authState) {
          //Return splash screen
          if (authState.isNotInit()) return Container();
          ScreenInfo _initScreenInfo;
          if (authState.active) {
            // _initScreenInfo = const ScreenInfo(name: ScreenName.main);
          } else {
            _initScreenInfo = const ScreenInfo(name: ScreenName.login);
          }
          return Provider<BlocFactory>(
            key: providerKey,
            create: (ctx) => BlocFactory(
              authBloc: BlocProvider.of<AuthBloc>(ctx),
            ),
            lazy: false,
            child: ,
          );
        },
      ),
    );
  }
}

class V24TeacherBindingObserver extends StatefulWidget {
  const V24TeacherBindingObserver({Key? key, required this.screenInfo, required this.authState,}) : super(key: key);

  final ScreenInfo screenInfo;
  final AuthState authState;

  @override
  _V24TeacherBindingObserverState createState() => _V24TeacherBindingObserverState();
}

class _V24TeacherBindingObserverState extends State<V24TeacherBindingObserver>  with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Defocuser(
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        localizationsDelegates: [
          const TextResourceDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: RootRouter(initScreenInfo: widget.screenInfo),
      ),
    );
  }
}

