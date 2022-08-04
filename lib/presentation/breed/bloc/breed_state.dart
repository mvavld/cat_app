part of 'breed_bloc.dart';

class BreedState extends Equatable {
  const BreedState({
    required this.breed,
    this.action,
  });

  final BreedEntity breed;
  final BlocAction? action;

  BreedState copyWith({
    BlocAction? action,
    BreedEntity? breed,
  }) {
    return BreedState(
      action: action ?? this.action,
      breed: breed ?? this.breed,
    );
  }

  @override
  List<Object?> get props => [
        action,
        breed,
      ];
}
