// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigateAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateBack,
    required TResult Function(NavigateType navigateType) navigateToMain,
    required TResult Function(NavigateType navigateType, BreedEntity breed)
        navigateToBreed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateBack value) navigateBack,
    required TResult Function(NavigateToMain value) navigateToMain,
    required TResult Function(NavigateToBreed value) navigateToBreed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigateActionCopyWith<$Res> {
  factory $NavigateActionCopyWith(
          NavigateAction value, $Res Function(NavigateAction) then) =
      _$NavigateActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigateActionCopyWithImpl<$Res>
    implements $NavigateActionCopyWith<$Res> {
  _$NavigateActionCopyWithImpl(this._value, this._then);

  final NavigateAction _value;
  // ignore: unused_field
  final $Res Function(NavigateAction) _then;
}

/// @nodoc
abstract class _$$NavigateBackCopyWith<$Res> {
  factory _$$NavigateBackCopyWith(
          _$NavigateBack value, $Res Function(_$NavigateBack) then) =
      __$$NavigateBackCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigateBackCopyWithImpl<$Res>
    extends _$NavigateActionCopyWithImpl<$Res>
    implements _$$NavigateBackCopyWith<$Res> {
  __$$NavigateBackCopyWithImpl(
      _$NavigateBack _value, $Res Function(_$NavigateBack) _then)
      : super(_value, (v) => _then(v as _$NavigateBack));

  @override
  _$NavigateBack get _value => super._value as _$NavigateBack;
}

/// @nodoc

class _$NavigateBack implements NavigateBack {
  _$NavigateBack();

  @override
  String toString() {
    return 'NavigateAction.navigateBack()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NavigateBack);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateBack,
    required TResult Function(NavigateType navigateType) navigateToMain,
    required TResult Function(NavigateType navigateType, BreedEntity breed)
        navigateToBreed,
  }) {
    return navigateBack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
  }) {
    return navigateBack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
    required TResult orElse(),
  }) {
    if (navigateBack != null) {
      return navigateBack();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateBack value) navigateBack,
    required TResult Function(NavigateToMain value) navigateToMain,
    required TResult Function(NavigateToBreed value) navigateToBreed,
  }) {
    return navigateBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
  }) {
    return navigateBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
    required TResult orElse(),
  }) {
    if (navigateBack != null) {
      return navigateBack(this);
    }
    return orElse();
  }
}

abstract class NavigateBack implements NavigateAction {
  factory NavigateBack() = _$NavigateBack;
}

/// @nodoc
abstract class _$$NavigateToMainCopyWith<$Res> {
  factory _$$NavigateToMainCopyWith(
          _$NavigateToMain value, $Res Function(_$NavigateToMain) then) =
      __$$NavigateToMainCopyWithImpl<$Res>;
  $Res call({NavigateType navigateType});
}

/// @nodoc
class __$$NavigateToMainCopyWithImpl<$Res>
    extends _$NavigateActionCopyWithImpl<$Res>
    implements _$$NavigateToMainCopyWith<$Res> {
  __$$NavigateToMainCopyWithImpl(
      _$NavigateToMain _value, $Res Function(_$NavigateToMain) _then)
      : super(_value, (v) => _then(v as _$NavigateToMain));

  @override
  _$NavigateToMain get _value => super._value as _$NavigateToMain;

  @override
  $Res call({
    Object? navigateType = freezed,
  }) {
    return _then(_$NavigateToMain(
      navigateType == freezed
          ? _value.navigateType
          : navigateType // ignore: cast_nullable_to_non_nullable
              as NavigateType,
    ));
  }
}

/// @nodoc

class _$NavigateToMain implements NavigateToMain {
  _$NavigateToMain(this.navigateType);

  @override
  final NavigateType navigateType;

  @override
  String toString() {
    return 'NavigateAction.navigateToMain(navigateType: $navigateType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToMain &&
            const DeepCollectionEquality()
                .equals(other.navigateType, navigateType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(navigateType));

  @JsonKey(ignore: true)
  @override
  _$$NavigateToMainCopyWith<_$NavigateToMain> get copyWith =>
      __$$NavigateToMainCopyWithImpl<_$NavigateToMain>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateBack,
    required TResult Function(NavigateType navigateType) navigateToMain,
    required TResult Function(NavigateType navigateType, BreedEntity breed)
        navigateToBreed,
  }) {
    return navigateToMain(navigateType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
  }) {
    return navigateToMain?.call(navigateType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
    required TResult orElse(),
  }) {
    if (navigateToMain != null) {
      return navigateToMain(navigateType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateBack value) navigateBack,
    required TResult Function(NavigateToMain value) navigateToMain,
    required TResult Function(NavigateToBreed value) navigateToBreed,
  }) {
    return navigateToMain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
  }) {
    return navigateToMain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
    required TResult orElse(),
  }) {
    if (navigateToMain != null) {
      return navigateToMain(this);
    }
    return orElse();
  }
}

abstract class NavigateToMain implements NavigateAction {
  factory NavigateToMain(final NavigateType navigateType) = _$NavigateToMain;

  NavigateType get navigateType;
  @JsonKey(ignore: true)
  _$$NavigateToMainCopyWith<_$NavigateToMain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NavigateToBreedCopyWith<$Res> {
  factory _$$NavigateToBreedCopyWith(
          _$NavigateToBreed value, $Res Function(_$NavigateToBreed) then) =
      __$$NavigateToBreedCopyWithImpl<$Res>;
  $Res call({NavigateType navigateType, BreedEntity breed});
}

/// @nodoc
class __$$NavigateToBreedCopyWithImpl<$Res>
    extends _$NavigateActionCopyWithImpl<$Res>
    implements _$$NavigateToBreedCopyWith<$Res> {
  __$$NavigateToBreedCopyWithImpl(
      _$NavigateToBreed _value, $Res Function(_$NavigateToBreed) _then)
      : super(_value, (v) => _then(v as _$NavigateToBreed));

  @override
  _$NavigateToBreed get _value => super._value as _$NavigateToBreed;

  @override
  $Res call({
    Object? navigateType = freezed,
    Object? breed = freezed,
  }) {
    return _then(_$NavigateToBreed(
      navigateType == freezed
          ? _value.navigateType
          : navigateType // ignore: cast_nullable_to_non_nullable
              as NavigateType,
      breed: breed == freezed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as BreedEntity,
    ));
  }
}

/// @nodoc

class _$NavigateToBreed implements NavigateToBreed {
  _$NavigateToBreed(this.navigateType, {required this.breed});

  @override
  final NavigateType navigateType;
  @override
  final BreedEntity breed;

  @override
  String toString() {
    return 'NavigateAction.navigateToBreed(navigateType: $navigateType, breed: $breed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToBreed &&
            const DeepCollectionEquality()
                .equals(other.navigateType, navigateType) &&
            const DeepCollectionEquality().equals(other.breed, breed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(navigateType),
      const DeepCollectionEquality().hash(breed));

  @JsonKey(ignore: true)
  @override
  _$$NavigateToBreedCopyWith<_$NavigateToBreed> get copyWith =>
      __$$NavigateToBreedCopyWithImpl<_$NavigateToBreed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateBack,
    required TResult Function(NavigateType navigateType) navigateToMain,
    required TResult Function(NavigateType navigateType, BreedEntity breed)
        navigateToBreed,
  }) {
    return navigateToBreed(navigateType, breed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
  }) {
    return navigateToBreed?.call(navigateType, breed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateBack,
    TResult Function(NavigateType navigateType)? navigateToMain,
    TResult Function(NavigateType navigateType, BreedEntity breed)?
        navigateToBreed,
    required TResult orElse(),
  }) {
    if (navigateToBreed != null) {
      return navigateToBreed(navigateType, breed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateBack value) navigateBack,
    required TResult Function(NavigateToMain value) navigateToMain,
    required TResult Function(NavigateToBreed value) navigateToBreed,
  }) {
    return navigateToBreed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
  }) {
    return navigateToBreed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateBack value)? navigateBack,
    TResult Function(NavigateToMain value)? navigateToMain,
    TResult Function(NavigateToBreed value)? navigateToBreed,
    required TResult orElse(),
  }) {
    if (navigateToBreed != null) {
      return navigateToBreed(this);
    }
    return orElse();
  }
}

abstract class NavigateToBreed implements NavigateAction {
  factory NavigateToBreed(final NavigateType navigateType,
      {required final BreedEntity breed}) = _$NavigateToBreed;

  NavigateType get navigateType;
  BreedEntity get breed;
  @JsonKey(ignore: true)
  _$$NavigateToBreedCopyWith<_$NavigateToBreed> get copyWith =>
      throw _privateConstructorUsedError;
}
