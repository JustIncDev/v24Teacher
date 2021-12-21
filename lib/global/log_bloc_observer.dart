import 'package:bloc/bloc.dart';
import 'logger/logger.dart';

class LogBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase<Object?> cubit, Change<Object?> change) {}

  @override
  void onClose(BlocBase<Object?> cubit) {
    Log.debug('BLOC onClose: ${cubit.runtimeType}');
  }

  @override
  void onCreate(BlocBase<Object?> cubit) {
    Log.debug('BLOC onCreate: ${cubit.runtimeType}');
  }

  @override
  void onError(BlocBase<Object?> cubit, Object error, StackTrace stackTrace) {
    Log.error('BLOC onError ${cubit.toString()}', exc: error, stackTrace: stackTrace);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    Log.debug('BLOC onEvent: ${event.toString()}');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {}
}
