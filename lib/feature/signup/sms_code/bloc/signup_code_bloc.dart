import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:v24_teacher_app/global/bloc.dart';

part 'signup_code_event.dart';
part 'signup_code_state.dart';

class SignUpCodeBloc extends Bloc<SignUpCodeEvent, SignUpCodeState> {
  SignUpCodeBloc() : super(SignUpCodeState()) {
    on<SignUpCodeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
