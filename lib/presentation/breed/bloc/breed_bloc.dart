import 'package:bloc/bloc.dart';
import 'package:cat_app/core/bloc/bloc_action.dart';
import 'package:cat_app/entities/breed_entity.dart';
import 'package:equatable/equatable.dart';

part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  BreedBloc({
    required BreedEntity breed,
  }) : super(BreedState(breed: breed)) {
    on<Init>(_onInit);
  }

  void _onInit(
    Init event,
    Emitter<BreedState> emit,
  ) {
    emit(
      state.copyWith(),
    );
  }
}
