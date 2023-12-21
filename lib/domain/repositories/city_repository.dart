import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';

typedef SeachByNameOutput = Future<Either<CityFailure, List<CityEntity>>>;

abstract interface class CityRepository {
  SeachByNameOutput searchByname({required String search});
}
