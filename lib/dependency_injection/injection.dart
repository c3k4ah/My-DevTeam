import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void initInjection() {
  final getIt = GetIt.instance;
  blocs(getIt);
  datasources(getIt);
  repositories(getIt);
  usecases(getIt);
  externalResources(getIt);
}

void blocs(GetIt getIt) {}

void datasources(GetIt getIt) {}

void repositories(GetIt getIt) {}

void usecases(GetIt getIt) {}

Future<void> service(GetIt getIt) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt
      .registerSingletonAsync<SharedPreferences>(() async => sharedPreferences);
}

void externalResources(GetIt getIt) {
  getIt.registerSingleton<http.Client>(http.Client());
}
