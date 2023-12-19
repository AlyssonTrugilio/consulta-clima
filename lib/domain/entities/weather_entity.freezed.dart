// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherEntity {
  double get temperature => throw _privateConstructorUsedError;
  double get minTemperature => throw _privateConstructorUsedError;
  double get maxTemperature => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get thermalSensation => throw _privateConstructorUsedError;
  CityEntity get city => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherEntityCopyWith<WeatherEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEntityCopyWith<$Res> {
  factory $WeatherEntityCopyWith(
          WeatherEntity value, $Res Function(WeatherEntity) then) =
      _$WeatherEntityCopyWithImpl<$Res, WeatherEntity>;
  @useResult
  $Res call(
      {double temperature,
      double minTemperature,
      double maxTemperature,
      double humidity,
      double thermalSensation,
      CityEntity city});

  $CityEntityCopyWith<$Res> get city;
}

/// @nodoc
class _$WeatherEntityCopyWithImpl<$Res, $Val extends WeatherEntity>
    implements $WeatherEntityCopyWith<$Res> {
  _$WeatherEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? minTemperature = null,
    Object? maxTemperature = null,
    Object? humidity = null,
    Object? thermalSensation = null,
    Object? city = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      thermalSensation: null == thermalSensation
          ? _value.thermalSensation
          : thermalSensation // ignore: cast_nullable_to_non_nullable
              as double,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CityEntityCopyWith<$Res> get city {
    return $CityEntityCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherEntityImplCopyWith<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  factory _$$WeatherEntityImplCopyWith(
          _$WeatherEntityImpl value, $Res Function(_$WeatherEntityImpl) then) =
      __$$WeatherEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double minTemperature,
      double maxTemperature,
      double humidity,
      double thermalSensation,
      CityEntity city});

  @override
  $CityEntityCopyWith<$Res> get city;
}

/// @nodoc
class __$$WeatherEntityImplCopyWithImpl<$Res>
    extends _$WeatherEntityCopyWithImpl<$Res, _$WeatherEntityImpl>
    implements _$$WeatherEntityImplCopyWith<$Res> {
  __$$WeatherEntityImplCopyWithImpl(
      _$WeatherEntityImpl _value, $Res Function(_$WeatherEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? minTemperature = null,
    Object? maxTemperature = null,
    Object? humidity = null,
    Object? thermalSensation = null,
    Object? city = null,
  }) {
    return _then(_$WeatherEntityImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      thermalSensation: null == thermalSensation
          ? _value.thermalSensation
          : thermalSensation // ignore: cast_nullable_to_non_nullable
              as double,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityEntity,
    ));
  }
}

/// @nodoc

class _$WeatherEntityImpl extends _WeatherEntity {
  const _$WeatherEntityImpl(
      {required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.humidity,
      required this.thermalSensation,
      required this.city})
      : super._();

  @override
  final double temperature;
  @override
  final double minTemperature;
  @override
  final double maxTemperature;
  @override
  final double humidity;
  @override
  final double thermalSensation;
  @override
  final CityEntity city;

  @override
  String toString() {
    return 'WeatherEntity(temperature: $temperature, minTemperature: $minTemperature, maxTemperature: $maxTemperature, humidity: $humidity, thermalSensation: $thermalSensation, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherEntityImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature) &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.thermalSensation, thermalSensation) ||
                other.thermalSensation == thermalSensation) &&
            (identical(other.city, city) || other.city == city));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temperature, minTemperature,
      maxTemperature, humidity, thermalSensation, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherEntityImplCopyWith<_$WeatherEntityImpl> get copyWith =>
      __$$WeatherEntityImplCopyWithImpl<_$WeatherEntityImpl>(this, _$identity);
}

abstract class _WeatherEntity extends WeatherEntity {
  const factory _WeatherEntity(
      {required final double temperature,
      required final double minTemperature,
      required final double maxTemperature,
      required final double humidity,
      required final double thermalSensation,
      required final CityEntity city}) = _$WeatherEntityImpl;
  const _WeatherEntity._() : super._();

  @override
  double get temperature;
  @override
  double get minTemperature;
  @override
  double get maxTemperature;
  @override
  double get humidity;
  @override
  double get thermalSensation;
  @override
  CityEntity get city;
  @override
  @JsonKey(ignore: true)
  _$$WeatherEntityImplCopyWith<_$WeatherEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
