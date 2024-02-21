part of 'injection.dart';

void datasources() {
  // Datasources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      getIt(),
    ),
  );
}
