// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:consultar_clima/domain/entities/entities.dart';

class WeatherEntity {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double humidity;
  final double thermalSensation;
  final CityEntity? city;

  const WeatherEntity({
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.thermalSensation,
    this.city,
  });

  WeatherEntity copyWith({
    double? temperature,
    double? minTemperature,
    double? maxTemperature,
    double? humidity,
    double? thermalSensation,
    CityEntity? city,
  }) {
    return WeatherEntity(
      temperature: temperature ?? this.temperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      humidity: humidity ?? this.humidity,
      thermalSensation: thermalSensation ?? this.thermalSensation,
      city: city ?? this.city,
    );
  }
}
