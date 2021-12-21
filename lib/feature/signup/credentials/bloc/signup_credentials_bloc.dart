import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:v24_teacher_app/global/bloc.dart';
import 'package:v24_teacher_app/global/ui/text_field/field_error.dart';
import 'package:v24_teacher_app/global/ui/text_field/input_field_type.dart';
import 'package:v24_teacher_app/res/localization/id_values.dart';

part 'signup_credentials_event.dart';
part 'signup_credentials_state.dart';

class SignUpCredentialsBloc extends Bloc<SignUpCredentialsEvent, SignUpCredentialsState> {
  SignUpCredentialsBloc() : super(SignUpCredentialsState()) {
    on<SignUpCredentialsEvent>((event, emit) {
      on<SignUpFieldInputEvent>(_mapFieldInputEvent);
      on<SignUpFieldValidateEvent>(_mapFieldValidateEvent);
      on<SignUpPerformEvent>(_mapPerformEvent);
    });
  }

  void _mapFieldInputEvent(
    SignUpFieldInputEvent event,
    Emitter<SignUpCredentialsState> emit,
  ) {
    switch (event.field) {
      case InputFieldType.firstName:
        if (event.value != state.firstNameValue) {
          emit(state.copyWith(
            firstNameValue: event.value,
            firstNameError: const FieldError.none(),
          ));
        }
        break;
      case InputFieldType.lastName:
        if (event.value != state.lastNameValue) {
          emit(state.copyWith(
            lastNameValue: event.value,
            lastNameError: const FieldError.none(),
          ));
        }
        break;
      case InputFieldType.email:
        if (event.value != state.emailValue) {
          emit(state.copyWith(
            emailValue: event.value,
            emailError: const FieldError.none(),
          ));
        }
        break;
      case InputFieldType.phone:
        if (event.value != state.phoneValue) {
          emit(state.copyWith(
            phoneValue: event.value,
            phoneError: const FieldError.none(),
          ));
        }
        break;
      case InputFieldType.password:
        if (event.value != state.passwordValue) {
          emit(state.copyWith(
            passwordValue: event.value,
            passwordError: const FieldError.none(),
          ));
        }
        break;
      case InputFieldType.confirmPassword:
        if (event.value != state.confirmValue) {
          emit(state.copyWith(
            confirmValue: event.value,
            confirmError: const FieldError.none(),
          ));
        }
        break;
    }
  }

  void _mapFieldValidateEvent(
    SignUpFieldValidateEvent event,
    Emitter<SignUpCredentialsState> emit,
  ) {
    switch (event.field) {
      case InputFieldType.firstName:
        emit(state.copyWith(
            firstNameError: validateName(
          state.firstNameValue,
          InputFieldType.firstName,
        )));
        break;
      case InputFieldType.lastName:
        emit(state.copyWith(
            lastNameError: validateName(
          state.lastNameValue,
          InputFieldType.lastName,
        )));
        break;
      case InputFieldType.phone:
        emit(state.copyWith(phoneError: validatePhone(state.phoneValue)));
        break;
      case InputFieldType.email:
        emit(state.copyWith(emailError: validateEmail(state.emailValue)));
        break;
      case InputFieldType.password:
        emit(state.copyWith(passwordError: validatePassword(state.passwordValue)));
        break;
      case InputFieldType.confirmPassword:
        if (state.confirmError.isNone()) {
          emit(state.copyWith(confirmError: validatePassword(state.confirmValue)));
        }
        break;
    }
  }

  void _mapPerformEvent(
    SignUpPerformEvent event,
    Emitter<SignUpCredentialsState> emit,
  ) {
    print(state.firstNameValue +
        state.lastNameValue +
        state.emailValue +
        state.phoneValue +
        state.passwordValue +
        state.confirmValue);
  }

  FieldError validateName(String userNameValue, InputFieldType type) {
    if (userNameValue.isEmpty) {
      if (type == InputFieldType.firstName) {
        return const FieldError(stringId: StringId.firstNameEmptyError);
      } else {
        return const FieldError(stringId: StringId.lastNameEmptyError);
      }
    }
    return const FieldError.none();
  }

  FieldError validatePhone(String phoneValue) {
    if (phoneValue.isEmpty) {
      return const FieldError(stringId: StringId.phoneEmptyError);
    }
    return const FieldError.none();
  }

  FieldError validateEmail(String emailValue) {
    if (emailValue.isEmpty) {
      return const FieldError(stringId: StringId.emailEmptyError);
    }
    return const FieldError.none();
  }

  FieldError validatePassword(String password) {
    if (password.isEmpty) {
      return const FieldError(stringId: StringId.passwordEmptyError);
    } else if (password.length < 8 || password.length > 35) {
      return const FieldError(stringId: StringId.passwordLengthError);
    }
    return const FieldError.none();
  }
}
