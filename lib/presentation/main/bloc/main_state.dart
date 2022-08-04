part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({
    this.action,
    this.breeds = const [],
  });

  final BlocAction? action;
  final List<BreedEntity> breeds;

  MainState copyWith({
    BlocAction? action,
    List<BreedEntity>? breeds,
  }) {
    return MainState(
      action: action ?? this.action,
      breeds: breeds ?? this.breeds,
    );
  }

  @override
  List<Object?> get props => [
        action,
        breeds,
      ];
}

class ShowNewBreeds extends BlocAction {
  ShowNewBreeds({
    required this.newBreeds,
    required this.totalBreedsCount,
  });
  List<BreedEntity> newBreeds;
  int totalBreedsCount;
}

class ShowLastBreeds extends BlocAction {
  ShowLastBreeds({required this.lastBreeds});
  List<BreedEntity> lastBreeds;
}

class RefreshBreeds extends BlocAction {}
