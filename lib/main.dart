import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:v24_teacher_app/application.dart';
import 'package:v24_teacher_app/global/injector.dart';
import 'package:v24_teacher_app/global/log_bloc_observer.dart';
import 'package:v24_teacher_app/global/logger/logger.dart';

void main() async {
  await Future.wait([
    _prepareApplicationStart(),
  ]);
  _startApplication();
}

Future<void> _prepareApplicationStart() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
}

void _startApplication() {
  Log.info('---------------------------------------------------------------------------');
  Log.info('START V24Student');
  Log.info('---------------------------------------------------------------------------');

  runZonedGuarded(
    () {
      BlocOverrides.runZoned(() => null, blocObserver: LogBlocObserver());
      (Zone.current[#injector] as Injector).init().then((injector) {
        runApp(V24TeacherApplication(injector: injector));
      });
    },
    (e, s) async {
      return Log.error('Unknown error', exc: e, stackTrace: s);
    },
    zoneValues: {#injector: Injector()},
  );
}
