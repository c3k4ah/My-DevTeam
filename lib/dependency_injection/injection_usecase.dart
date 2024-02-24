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

  getIt.registerLazySingleton<GetHomeCachedUserUseCase>(
    () => GetHomeCachedUserUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeleteUserUseCase>(
    () => DeleteUserUseCase(getIt()),
  );

  // Project
  getIt.registerLazySingleton<GetAllProjectsUseCase>(
    () => GetAllProjectsUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<GetProjectByIdUseCase>(
    () => GetProjectByIdUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<CreateProjectUseCase>(
    () => CreateProjectUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<UpdateProjectUseCase>(
    () => UpdateProjectUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<DeleteProjectUseCase>(
    () => DeleteProjectUseCase(
      getIt(),
    ),
  );
}
