import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc_providers/bloc_providers.dart';
import 'core/routes/app_router.dart';
import 'core/styles/themes.dart';
import 'features/auth/presentation/sign_in/manager/sign_in_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final router = AppRouter(state.status);
          return CalendarControllerProvider(
            controller: EventController(),
            child: MaterialApp.router(
              title: 'Diaspora Dating',
              theme: theme,
              routerConfig: router.config(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('fr'),
              ],
            ),
          );
        },
      ),
    );
  }
}
