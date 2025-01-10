import 'package:dartz/dartz.dart';

import '../failures/city_failure.dart';
import '../entities/entities.dart';

typedef SearchCityOutput = Future<Either<CityFailure, List<CityEntity>>>;

abstract class SearchCityUseCase {
  SearchCityOutput call({required String input});
}
