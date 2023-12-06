import 'package:flutter/material.dart';

import '../domain/domain.dart';

class SearchWeatherUseCaseImpl implements SearchWeatherUseCase {
  final WeatherRepository repository;

  const SearchWeatherUseCaseImpl({required this.repository});

  @override
  Future<WeatherEntity> call(
      {required String city,
      required String state,
      required String country,
      required double latitude,
      required double longitude}) async {
    if (latitude == 0 || longitude == 0) {
      throw Exception(const Center(
        child: Text('Nenhuma localização informada.'),
      ));
    }

    if (city.isEmpty) {
      throw Exception(const Center(
        child: Text('Nenhuma cidade válida informada'),
      ));
    }

    final weather = await repository.searchByLocation(
      latitude: latitude,
      longitude: longitude,
    );

    final currentCity = CityEntity(
        name: city,
        latitude: latitude,
        longitude: longitude,
        country: country,
        state: state);

    final weatherAndCity = weather.copyWith(
      city: currentCity,
    );

    return weatherAndCity;
  }
}
