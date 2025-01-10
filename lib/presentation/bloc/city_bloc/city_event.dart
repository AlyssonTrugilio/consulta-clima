part of 'city_bloc.dart';


@freezed
class CityEvent with _$CityEvent{
  const factory CityEvent.searchChanged({
    required String value,
  }) = _SeachChanged;
  const factory CityEvent.searchCleaned() = _SearchCleaned;
  const factory CityEvent.seachrConsulted() = _SeachrConsulted;
  const CityEvent._();
}