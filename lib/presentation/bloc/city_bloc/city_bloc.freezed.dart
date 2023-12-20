// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CityState {
  String get searchField => throw _privateConstructorUsedError;
  List<CityEntity> get cities => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityStateCopyWith<CityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityStateCopyWith<$Res> {
  factory $CityStateCopyWith(CityState value, $Res Function(CityState) then) =
      _$CityStateCopyWithImpl<$Res, CityState>;
  @useResult
  $Res call(
      {String searchField,
      List<CityEntity> cities,
      String errorMessage,
      bool isLoading});
}

/// @nodoc
class _$CityStateCopyWithImpl<$Res, $Val extends CityState>
    implements $CityStateCopyWith<$Res> {
  _$CityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchField = null,
    Object? cities = null,
    Object? errorMessage = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      searchField: null == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityEntity>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityStateImplCopyWith<$Res>
    implements $CityStateCopyWith<$Res> {
  factory _$$CityStateImplCopyWith(
          _$CityStateImpl value, $Res Function(_$CityStateImpl) then) =
      __$$CityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchField,
      List<CityEntity> cities,
      String errorMessage,
      bool isLoading});
}

/// @nodoc
class __$$CityStateImplCopyWithImpl<$Res>
    extends _$CityStateCopyWithImpl<$Res, _$CityStateImpl>
    implements _$$CityStateImplCopyWith<$Res> {
  __$$CityStateImplCopyWithImpl(
      _$CityStateImpl _value, $Res Function(_$CityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchField = null,
    Object? cities = null,
    Object? errorMessage = null,
    Object? isLoading = null,
  }) {
    return _then(_$CityStateImpl(
      searchField: null == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityEntity>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CityStateImpl extends _CityState {
  const _$CityStateImpl(
      {required this.searchField,
      required final List<CityEntity> cities,
      required this.errorMessage,
      required this.isLoading})
      : _cities = cities,
        super._();

  @override
  final String searchField;
  final List<CityEntity> _cities;
  @override
  List<CityEntity> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  final String errorMessage;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CityState(searchField: $searchField, cities: $cities, errorMessage: $errorMessage, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityStateImpl &&
            (identical(other.searchField, searchField) ||
                other.searchField == searchField) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchField,
      const DeepCollectionEquality().hash(_cities), errorMessage, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CityStateImplCopyWith<_$CityStateImpl> get copyWith =>
      __$$CityStateImplCopyWithImpl<_$CityStateImpl>(this, _$identity);
}

abstract class _CityState extends CityState {
  const factory _CityState(
      {required final String searchField,
      required final List<CityEntity> cities,
      required final String errorMessage,
      required final bool isLoading}) = _$CityStateImpl;
  const _CityState._() : super._();

  @override
  String get searchField;
  @override
  List<CityEntity> get cities;
  @override
  String get errorMessage;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CityStateImplCopyWith<_$CityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
