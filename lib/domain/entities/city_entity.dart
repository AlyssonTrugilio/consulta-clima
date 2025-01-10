import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_entity.freezed.dart';

@freezed
class CityEntity with _$CityEntity {
  const factory CityEntity({
    required final String name,
    required final double latitude,
    required final double longitude,
    required final String country,
    required final String state,
  }) = _CityEntity;

  factory CityEntity.empty() {
    return const CityEntity(
      name: '',
      latitude: 0,
      longitude: 0,
      country: '',
      state: '',
    );
  }

  String get addressFull => '$name, $state - $country';

  const CityEntity._();
}
