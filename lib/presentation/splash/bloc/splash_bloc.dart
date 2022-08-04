import 'package:bloc/bloc.dart';
import 'package:cat_app/core/bloc/bloc_action.dart';
import 'package:cat_app/data/gateways/preferences_local_gateway.dart';
import 'package:cat_app/navigation/navigation_action.dart';
import 'package:cat_app/navigation/navigation_type.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required PreferencesLocalGateway preferencesLocalGateway,
  })  : _preferencesLocalGateway = preferencesLocalGateway,
        super(const SplashState()) {
    on<Init>(_onInit);
    add(Init());
  }

  final PreferencesLocalGateway _preferencesLocalGateway;

  Future<void> _onInit(
    Init event,
    Emitter<SplashState> emit,
  ) async {
    await _preferencesLocalGateway
        .setToken('1c90eefe-886a-4e30-9666-53461e28740b');

    emit(
      state.copyWith(
        action: NavigateToMain(NavigateType.pushReplacement),
      ),
    );
  }
}
