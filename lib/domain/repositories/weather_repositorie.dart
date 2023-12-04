
import '../entities/entities.dart';

abstract interface class WeatherRepository {
  Future<WeatherEntity> searchByLocation(
      {required double latitude, required double longitude});
}
