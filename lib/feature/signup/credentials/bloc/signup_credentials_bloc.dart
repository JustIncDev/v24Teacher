import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:v24_teacher_app/global/bloc.dart';
import 'package:v24_teacher_app/global/ui/text_field/field_error.dart';

part 'signup_credentials_event.dart';
part 'signup_credentials_state.dart';

class SignUpCredentialsBloc extends Bloc<SignUpCredentialsEvent, SignUpCredentialsState> {
  SignUpCredentialsBloc() : super(SignUpCredentialsState()) {
    on<SignUpCredentialsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
