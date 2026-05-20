part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashSuccess extends SplashState {
  final String nextRoute;

  const SplashSuccess({required this.nextRoute});

  @override
  List<Object> get props => [nextRoute];
}
