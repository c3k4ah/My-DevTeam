import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dependency_injection/injection.dart';
import 'myapp.dart';

Future<void> main() async {
  await initializeDateFormatting('fr_FR', null);
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  // await windowManager.ensureInitialized();

  // WindowOptions windowOptions = const WindowOptions(
  // size: Size(1300, 800),
  // minimumSize: Size(1300, 800),
  // maximumSize: Size(1300, 800),
  //   center: true,
  //   fullScreen: false,
  //   backgroundColor: Colors.transparent,
  //   skipTaskbar: false,
  //   titleBarStyle: TitleBarStyle.normal,
  // );
  // windowManager.waitUntilReadyToShow(windowOptions, () async {
  //   await windowManager.show();
  //   await windowManager.focus();
  // });
  await initInjection();
  runApp(const MyApp());
}
