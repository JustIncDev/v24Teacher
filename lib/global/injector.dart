import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v24_teacher_app/global/data_blocs/auth/auth_bloc.dart';
import 'package:v24_teacher_app/global/log_bloc_observer.dart';

class Injector {
  late AuthBloc _authBloc;

  Future<Injector> init() async {
    _authBloc = AuthBloc();

    return Future.wait([
      _authBloc.init(),
    ]).then((value) => this);
  }

  AuthBloc get authBloc => _authBloc;
}
