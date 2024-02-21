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
}
