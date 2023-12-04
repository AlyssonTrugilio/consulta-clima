import '../../domain/domain.dart';

extension WeatherDto on WeatherEntity {
  static WeatherEntity fromJson(dynamic data) {
    final mainMap = data['temp'];

    return WeatherEntity(
      temperature: mainMap['temp'] as double,
      minTemperature: mainMap['temp_min'] as double,
      maxTemperature: mainMap['temp_max'] as double,
      humidity: mainMap['humidity'] as double,
      thermalSensation: mainMap['feels_like'] as double,
    );
  }
}
