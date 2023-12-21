import 'package:consultar_clima/domain/domain.dart';
import 'package:dartz/dartz.dart';

typedef SearchWeatherOutput = Future<Either<WeatherFailure, WeatherEntity>>;

abstract interface class SearchWeatherUseCase {
  SearchWeatherOutput call({
    required String city,
    required String state,
    required String country,
    required double latitude,
    required double longitude,
  });
}
