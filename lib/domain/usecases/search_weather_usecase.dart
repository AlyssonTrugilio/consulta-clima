import '../entities/entities.dart';

abstract interface class SearchWeatherUseCase {
  Future<WeatherEntity> call({
    required String city,
    required String state,
    required String country,
    required double latitude,
    required double longitude,
  });
}
