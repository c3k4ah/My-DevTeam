import 'package:auto_route/auto_route.dart';

import '../../../features/auth/presentation/sign_in/manager/sign_in_bloc.dart';
import '../app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthStatus authenticated;

  AuthGuard(
    this.authenticated,
  );

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // ignore: avoid_print
    print('auth : ${AuthStatus.logged == authenticated}');
    if (AuthStatus.logged == authenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(const LoginRoute(), replace: true);
    }
  }
}
