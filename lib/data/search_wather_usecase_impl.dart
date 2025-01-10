import 'package:dartz/dartz.dart';

import '../domain/domain.dart';

class SearchWeatherUseCaseImpl implements SearchWeatherUseCase {
  final WeatherRepository repository;

  const SearchWeatherUseCaseImpl({required this.repository});

  @override
  SearchWeatherOutput call(
      {required String city,
      required String state,
      required String country,
      required double latitude,
      required double longitude}) async {
    if (latitude == 0 || longitude == 0) {
      return left(const WeatherFailure.noLocationGiven());
    }

    if (city.isEmpty) {
      return left(const WeatherFailure.noValidCityReported());
    }

    final response = await repository.searchByLocation(
      latitude: latitude,
      longitude: longitude,
    );

    return response.fold(
      (failue) => left(failue),
      (weather) {
        final currentCity = CityEntity(
          name: city,
          latitude: latitude,
          longitude: longitude,
          country: country,
          state: state,
        );
        final weatherAndCity = weather.copyWith(
          city: currentCity,
        );
        return right(weatherAndCity);
      },
    );
  }
}
