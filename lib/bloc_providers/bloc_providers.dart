import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

import '../features/auth/presentation/sign_in/manager/sign_in_bloc.dart';
import '../features/home/presentation/manager/home_bloc.dart';
import '../features/project/presentation/bloc/project_bloc.dart';

final getIt = GetIt.instance;

List<SingleChildWidget> get blocProviders => [
      BlocProvider(
        lazy: false,
        create: (context) => getIt<AuthBloc>(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => getIt<HomeBloc>(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => getIt<ProjectBloc>(),
      ),
    ];
