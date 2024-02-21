part of 'injection.dart';

void repositories() {
  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt(),
      getIt(),
      getIt(),
    ),
  );
}
