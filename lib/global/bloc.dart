import 'package:equatable/equatable.dart';

abstract class BaseBlocEvent extends Equatable {
  @override
  bool get stringify => false;
}

abstract class BaseBlocState extends Equatable {}