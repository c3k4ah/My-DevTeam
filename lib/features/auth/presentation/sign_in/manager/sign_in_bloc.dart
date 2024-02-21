import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../../core/DTO/entities/user_enetity.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../domain/domain.dart';
import '../../../domain/entities/login_params.dart';

import '../../../domain/usecases/login_with_facebook_usecase.dart';
import '../../../domain/usecases/login_with_google_usecase.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.checkUserIsConnectedUsecase,
    this.userLoginUseCase,
    this.getCachedUserUseCase,
    this.loginWithGoogleUseCase,
    this.loginWithFacebookUseCase,
  ) : super(const InitialAuthState()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginGoogleButtonController = RoundedLoadingButtonController();
    loginFacebookButtonController = RoundedLoadingButtonController();

    on<CheckIsAuthenticatedAuthEvent>(_onCheckUserAuthenticated);
    on<LoginAuthEvent>(_onLoginUser);
    on<ResetAuthStateEvent>(_resetAuthBloc);
    on<FetchUserAuthEvent>(_fetchUser);
    on<LoginWithGoogleEvent>(_loginWithGoogle);
    on<LoginWithFacebookEvent>(_loginWithFacebook);
    on<ChangedAuthAtatusEvent>(_changeAuthStatus);
  }

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late RoundedLoadingButtonController loginGoogleButtonController;

  late RoundedLoadingButtonController loginFacebookButtonController;

  final CheckUserIsConnectedUsecase checkUserIsConnectedUsecase;

  final LoginUserUseCase userLoginUseCase;

  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  final GetCachedUserUseCase getCachedUserUseCase;

  final LoginWithDFacebookUseCase loginWithFacebookUseCase;

  Future<void> _resetAuthBloc(
    ResetAuthStateEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const InitialAuthState());
  }

  Future<void> _onCheckUserAuthenticated(
    CheckIsAuthenticatedAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await checkUserIsConnectedUsecase(NoParams());

    res.fold(
      (l) => emit(
        state.copyWith(
          status: AuthStatus.initial,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: r ? AuthStatus.logged : AuthStatus.error,
        ),
      ),
    );
  }

  Future<void> _onLoginUser(
    LoginAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    state.copyWith(
      status: AuthStatus.loading,
    );

    final res = await userLoginUseCase(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    res.fold(
      (l) {
        emit(
          state.copyWith(
            status: AuthStatus.error,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: AuthStatus.logged,
            user: r,
          ),
        );
      },
    );
  }

  Future<void> _fetchUser(
    FetchUserAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await getCachedUserUseCase(NoParams());
    res.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(
          user: r,
        ),
      ),
    );
  }

  Future<void> _loginWithGoogle(
    LoginWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    loginGoogleButtonController.start();
    final res = await loginWithGoogleUseCase(NoParams());
    res.fold(
      (l) {
        loginGoogleButtonController.error();
        emit(
          state.copyWith(
            status: AuthStatus.error,
          ),
        );
      },
      (r) {
        loginGoogleButtonController.success();
        emit(
          state.copyWith(
            status: AuthStatus.logged,
            user: r,
          ),
        );
      },
    );
    loginGoogleButtonController.reset();
  }

  Future<void> _loginWithFacebook(
    LoginWithFacebookEvent event,
    Emitter<AuthState> emit,
  ) async {
    loginFacebookButtonController.start();
    final res = await loginWithFacebookUseCase(NoParams());
    res.fold(
      (l) {
        loginFacebookButtonController.error();
        emit(
          state.copyWith(
            status: AuthStatus.error,
          ),
        );
      },
      (r) {
        loginFacebookButtonController.success();
        emit(
          state.copyWith(
            status: AuthStatus.logged,
            user: r,
          ),
        );
      },
    );
    loginFacebookButtonController.reset();
  }

  Future<void> _changeAuthStatus(
    ChangedAuthAtatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: event.status,
      ),
    );
  }
}
