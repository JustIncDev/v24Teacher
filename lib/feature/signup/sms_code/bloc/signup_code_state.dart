part of 'signup_code_bloc.dart';

class SignUpCodeState extends BaseBlocState {
  SignUpCodeState({
    this.currentCodePosition = -1,
    this.firstCodeValue = '',
    this.secondCodeValue = '',
    this.thirdCodeValue = '',
    this.fourthCodeValue = '',
    this.finalCode = '',
  });

  final int currentCodePosition;
  final String firstCodeValue;
  final String secondCodeValue;
  final String thirdCodeValue;
  final String fourthCodeValue;
  final String? finalCode;

  SignUpCodeState copyWith({
    int? currentCodePosition,
    String? firstCodeValue,
    String? secondCodeValue,
    String? thirdCodeValue,
    String? fourthCodeValue,
  }) {
    return SignUpCodeState(
      currentCodePosition: currentCodePosition ?? this.currentCodePosition,
      firstCodeValue: firstCodeValue ?? this.firstCodeValue,
      secondCodeValue: secondCodeValue ?? this.secondCodeValue,
      thirdCodeValue: thirdCodeValue ?? this.thirdCodeValue,
      fourthCodeValue: fourthCodeValue ?? this.fourthCodeValue,
    );
  }

  @override
  List<Object?> get props => [
        currentCodePosition,
        firstCodeValue,
        secondCodeValue,
        thirdCodeValue,
        fourthCodeValue,
      ];
}
