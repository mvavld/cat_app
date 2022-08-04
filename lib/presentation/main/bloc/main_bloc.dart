import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_app/core/bloc/bloc_action.dart';
import 'package:cat_app/core/enums/message_type.dart';
import 'package:cat_app/core/failures.dart';
import 'package:cat_app/data/gateways/preferences_local_gateway.dart';
import 'package:cat_app/data/repositories/cat_repository.dart';
import 'package:cat_app/entities/breed_entity.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required CatRepository catRepository,
    required PreferencesLocalGateway preferencesLocalGateway,
  })  : _catRepository = catRepository,
        _preferencesLocalGateway = preferencesLocalGateway,
        super(const MainState()) {
    on<Init>(_onInit);
    on<PageScrolled>(_onPageScrolled);
    add(Init());
  }

  final PreferencesLocalGateway _preferencesLocalGateway;
  final CatRepository _catRepository;

  static const int _pageSizeBreeds = 15;

  int get _newPageBreeds => _currentPageMessages + 1;

  int _currentPageMessages = 0;

  void _onInit(
    Init event,
    Emitter<MainState> emit,
  ) {
    emit(
      state.copyWith(),
    );
  }

  Future<void> _onPageScrolled(
    PageScrolled event,
    Emitter<MainState> emit,
  ) async {
    if (event.itemsScrolled >= state.breeds.length) {
      await _fetchBreeds(emit);
    }
  }

  FutureOr<void> _fetchBreeds(
    Emitter<MainState> emit, {
    bool needShowLoader = false,
  }) async {
    if (needShowLoader) {
      emit(state.copyWith(action: ShowLoader()));
    }
    final token = (await _preferencesLocalGateway.getToken()) ?? '';

    final result = await _catRepository.getBreeds(
      token: token,
      limit: _pageSizeBreeds,
      page: _newPageBreeds,
      attachBreed: 0,
    );
    result.fold(
      (data) {
        if (data.length < _pageSizeBreeds) {
          print('SHOWING LASTPAGE, Items fetched: ${data.length}');
          emit(
            state.copyWith(
              breeds: data,
              action: ShowLastBreeds(
                lastBreeds: data,
              ),
            ),
          );
        } else {
          print(
              'SHOWING LASTPAGE, Items fetched: ${data.length}, page: ${_currentPageMessages}');
          emit(
            state.copyWith(
              breeds: data,
              action: ShowNewBreeds(
                newBreeds: data,
                totalBreedsCount: state.breeds.length + data.length,
              ),
            ),
          );
        }
        _currentPageMessages += 1;
      },
      (error) => _handleError(emit, error),
    );
  }

  FutureOr<void> _handleError(Emitter<MainState> emit, Failure? error) async {
    if (error is RequestFailure) {
      emit(
        state.copyWith(
          action: ShowMessage(messageType: MessageType.serverError),
        ),
      );
    }
    if (error is NetworkFailure) {
      emit(
        state.copyWith(
          action: ShowMessage(messageType: MessageType.noConnection),
        ),
      );
    }
    if (error is UndefinedFailure) {
      emit(
        state.copyWith(
          action: ShowMessage(messageType: MessageType.serverError),
        ),
      );
    }
  }
}
