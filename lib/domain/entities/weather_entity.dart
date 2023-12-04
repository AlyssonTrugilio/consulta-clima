class WeatherEntity {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double humidity;
  final double thermalSensation;

  const WeatherEntity(
      {required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.humidity,
      required this.thermalSensation});
}
