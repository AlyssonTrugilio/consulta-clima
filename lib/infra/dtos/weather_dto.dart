import '../../domain/domain.dart';

extension WeatherDto on WeatherEntity {
  static WeatherEntity fromJson(dynamic data) {
    final mainMap = data['temp'];

    return WeatherEntity(
      temperature: (mainMap['temp'] as num).toDouble(),
      minTemperature: (mainMap['temp_min'] as num).toDouble(),
      maxTemperature: (mainMap['temp_max'] as num).toDouble(),
      humidity: (mainMap['humidity'] as num).toDouble(),
      thermalSensation: (mainMap['feels_like'] as num).toDouble(),
    );
  }
}
