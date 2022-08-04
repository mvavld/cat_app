import 'package:cat_app/core/bloc/bloc_action.dart';
import 'package:cat_app/entities/breed_entity.dart';
import 'package:cat_app/navigation/navigation_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_action.freezed.dart';

@freezed
class NavigateAction with _$NavigateAction implements BlocAction {
  factory NavigateAction.navigateBack() = NavigateBack;

  factory NavigateAction.navigateToMain(NavigateType navigateType) =
      NavigateToMain;

  factory NavigateAction.navigateToBreed(
    NavigateType navigateType, {
    required BreedEntity breed,
  }) = NavigateToBreed;
}
