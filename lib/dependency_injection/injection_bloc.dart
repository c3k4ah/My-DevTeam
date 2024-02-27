part of 'injection.dart';

void blocs() {
  // Bloc
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<ProjectBloc>(
    () => ProjectBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
}
