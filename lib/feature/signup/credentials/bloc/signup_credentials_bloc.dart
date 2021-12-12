import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_credentials_event.dart';
part 'signup_credentials_state.dart';

class SignupCredentialsBloc extends Bloc<SignupCredentialsEvent, SignupCredentialsState> {
  SignupCredentialsBloc() : super(SignupCredentialsInitial()) {
    on<SignupCredentialsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
