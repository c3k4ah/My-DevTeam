import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mydevteam/features/project/data/data.dart';
import 'package:mydevteam/features/project/domain/domaine.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/const_url.dart';
import '../core/constants/shared_preference_key.dart';
import '../core/networks/network.dart';
import '../core/networks/network_info.dart';
import '../core/source/interceptors/auth_interceptor.dart';
import '../core/source/remote/pocket_base_source.dart';
import '../core/source/remote/pocket_base_source_impl.dart';
import '../core/source/remote/remote_source.dart';
import '../core/source/remote/remote_source_impl.dart';
import '../features/auth/data/datasources/local/auth_local_data_source.dart';
import '../features/auth/data/datasources/local/auth_local_data_source_impl.dart';
import '../features/auth/data/datasources/remote/auth_remote_data_source.dart';
import '../features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/check_user_is_connected_usecase.dart';
import '../features/auth/domain/usecases/get_cached_user_usecase.dart';
import '../features/auth/domain/usecases/login_user_usecase.dart';
import '../features/auth/domain/usecases/login_with_facebook_usecase.dart';
import '../features/auth/domain/usecases/login_with_google_usecase.dart';
import '../features/auth/presentation/sign_in/manager/sign_in_bloc.dart';
import '../features/chat/data/datasources/chat_data_source.dart';
import '../features/chat/data/datasources/chat_data_source_impl.dart';
import '../features/chat/data/repositories/repositorie.dart';
import '../features/chat/domain/repositories/repositorie.dart';
import '../features/chat/domain/usecases/get_all_message_usecase.dart';
import '../features/chat/domain/usecases/send_message_usecase.dart';
import '../features/chat/presentation/manager/chat_bloc.dart';
import '../features/home/data/datasources/local/local_data_source.dart';
import '../features/home/data/datasources/local/local_data_source_impl.dart';
import '../features/home/data/repositories/repository_impl.dart';
import '../features/home/domain/repositories/repository.dart';
import '../features/home/domain/usecases/usecases.dart';
import '../features/home/presentation/manager/home_bloc.dart';
import '../features/project/data/datasources/project.remotedata.impl.dart';
import '../features/project/domain/usecases/get_all_user_usecase.dart';
import '../features/project/presentation/manager/project_bloc.dart';

part 'injection_bloc.dart';

part 'injection_usecase.dart';

part 'injection_repository.dart';

part 'injection_datasource.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  blocs();
  await service();
  datasources();
  repositories();
  usecases();
  externalResources();
}

Future<void> service() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // await sharedPreferences.clear();
  final store = AsyncAuthStore(
    save: (data) async {
      await sharedPreferences.setString(SharedPreferenceKey.pbAuth, data);
    },
    initial: sharedPreferences.getString(SharedPreferenceKey.pbAuth),
  );

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerLazySingleton<AuthStore>(() => AuthStore());

  final dio = Dio(
    BaseOptions(
      baseUrl: '${ConstString.baseUrl}/api/',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    ),
  );
  dio.interceptors.add(AuthInterceptor(dio));
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
    ),
  );
  final pb = PocketBase(ConstString.baseUrl, authStore: store);

  getIt.registerSingleton(dio);
  getIt.registerLazySingleton<RemoteSource>(() => RemoteSourceImpl(dio));
  getIt.registerLazySingleton<PocketBaseSource>(() => PocketBaseSourceImpl(pb));
}

void externalResources() {
  getIt.registerLazySingleton(() => InternetConnection());

  getIt.registerLazySingleton<ConnexionChecker>(
    () => ConnexionCheckerImp(
      connectivity: getIt<InternetConnection>(),
    ),
  );
}
