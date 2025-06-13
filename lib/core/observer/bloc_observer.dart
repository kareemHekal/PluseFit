import 'package:bloc/bloc.dart';
import 'package:fit_zone/core/di/di.dart';
import 'package:logger/logger.dart';

class MyBlocObserver extends BlocObserver {
  final _logger = getIt<Logger>();
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _logger.t('onCreate -- ${bloc.runtimeType.toString()}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.t('onChange -- ${bloc.runtimeType.toString()} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.t('onError -- ${bloc.runtimeType.toString()} $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _logger.t('onClose -- ${bloc.runtimeType.toString()}');
  }
}
