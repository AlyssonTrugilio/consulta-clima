import 'package:freezed_annotation/freezed_annotation.dart';

import 'city_entity.dart';

part 'weather_entity.freezed.dart';

@freezed
class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required double temperature,
    required double minTemperature,
    required double maxTemperature,
    required double humidity,
    required double thermalSensation,
    required CityEntity city,
  }) = _WeatherEntity;

  const WeatherEntity._();
}
