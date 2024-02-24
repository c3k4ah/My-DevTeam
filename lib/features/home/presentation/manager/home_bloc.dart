import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/DTO/entities/user_enetity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeCachedUserUseCase getCachedUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  HomeBloc(
    this.getCachedUserUseCase,
    this.deleteUserUseCase,
  ) : super(const InitialHomeState()) {
    on<GetUserEvent>(_getUser);
    on<DeleteUserEvent>(_deleteUser);
  }

  Future<void> _getUser(GetUserEvent event, Emitter<HomeState> emit) async {
    emit(const HomeState(status: HomeStatus.loading));
    final result = await getCachedUserUseCase(NoParams());
    result.fold(
        (failure) => emit(
              const HomeState(
                status: HomeStatus.error,
              ),
            ), (user) {
      emit(
        HomeState(
          user: user,
          status: HomeStatus.loaded,
        ),
      );
    });
  }

  Future<void> _deleteUser(
      DeleteUserEvent event, Emitter<HomeState> emit) async {
    emit(const HomeState(status: HomeStatus.loading));
    final result = await deleteUserUseCase(NoParams());
    result.fold(
      (failure) => emit(const HomeState(status: HomeStatus.error)),
      (_) => emit(
        const HomeState(
          status: HomeStatus.initial,
        ),
      ),
    );
  }
}
