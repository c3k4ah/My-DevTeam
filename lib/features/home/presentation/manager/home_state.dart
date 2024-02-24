part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  error,
  loaded,
}

class HomeState extends Equatable {
  final UserEntity? user;
  final HomeStatus status;
  const HomeState({this.user, required this.status});

  HomeState copyWith({
    UserEntity? user,
    HomeStatus? status,
  }) {
    return HomeState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        user,
        status,
      ];
}

class InitialHomeState extends HomeState {
  const InitialHomeState({
    super.user,
    super.status = HomeStatus.initial,
  });
}
