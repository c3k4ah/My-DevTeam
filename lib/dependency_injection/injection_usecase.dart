part of 'injection.dart';

void usecases() {
  // Authentification
  getIt.registerLazySingleton<CheckUserIsConnectedUsecase>(
    () => CheckUserIsConnectedUsecase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<LoginUserUseCase>(
    () => LoginUserUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<GetCachedUserUseCase>(
    () => GetCachedUserUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(getIt()),
  );
  getIt.registerLazySingleton<LoginWithDFacebookUseCase>(
    () => LoginWithDFacebookUseCase(getIt()),
  );
}
