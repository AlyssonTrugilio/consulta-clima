import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_failure.freezed.dart';

@freezed
class WeatherFailure with _$WeatherFailure {
  const factory WeatherFailure.noLocationGiven() =_NoLocationGiven;
  const factory WeatherFailure.noValidCityReported() = _NoValidCityReported;
  const factory WeatherFailure.unexpected() = _Unexpected;

  const WeatherFailure._();
}
