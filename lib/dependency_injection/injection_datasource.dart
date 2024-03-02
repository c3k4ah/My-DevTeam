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

  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      getIt(),
    ),
  );

  getIt.registerLazySingleton<ProjectRemoteData>(
    () => ProjectDataSourceImpl(
      getIt(),
    ),
  );

  getIt.registerLazySingleton<ChatDataSource>(
    () => ChatDataSourceImpl(
      getIt(),
    ),
  );
}
