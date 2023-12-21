import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_failure.freezed.dart';

@freezed
class CityFailure with _$CityFailure {
  const factory CityFailure.notFound() = _NotFound;
  const factory CityFailure.noCityReported() = _NoCityReported;
  const factory CityFailure.noInternetAccess() = _NoInternetAccess;
  const factory CityFailure.unexpected() = _Unexpected;

  const CityFailure._();
}
