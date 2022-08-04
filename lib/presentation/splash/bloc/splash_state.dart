part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.action,
  });

  final BlocAction? action;

  SplashState copyWith({
    BlocAction? action,
  }) {
    return SplashState(
      action: action ?? this.action,
    );
  }

  @override
  List<Object?> get props => [
        action,
      ];
}
