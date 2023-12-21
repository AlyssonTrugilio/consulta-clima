import 'package:consultar_clima/domain/domain.dart';
import 'package:dartz/dartz.dart';

typedef SearchByLocationOutput = Future<Either<WeatherFailure, WeatherEntity>>;

abstract interface class WeatherRepository {
  SearchByLocationOutput searchByLocation(
      {required double latitude, required double longitude});
}
