import 'package:easy_localization/easy_localization.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'core/observer/bloc_observer.dart';
import 'my_app.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    configureDependencies();
    Bloc.observer = MyBlocObserver();
    ApiManager.init();

    final authCubit = getIt<AuthCubit>();


    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        child: BlocProvider<AuthCubit>(
          create: (context) => authCubit,
          child: const MyApp(),
        ),
      ),
    );
  }
