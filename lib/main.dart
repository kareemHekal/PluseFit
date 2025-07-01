import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_zone/firebase_options.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/api/api_manager.dart';
import 'core/cache/shared_pref.dart';
import 'core/di/di.dart';
import 'core/observer/bloc_observer.dart';
import 'data/model/smart_coach/conversation_model.dart';
import 'data/model/smart_coach/message_model.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(ConversationModelAdapter());
  Hive.registerAdapter(MessageModelAdapter());
  await configureDependencies();
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  await CacheHelper.init();
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
