part of "city_bloc.dart";

abstract interface class CityState {
  const CityState();
}

class InitialityState extends CityState {
  const InitialityState();
}

class LoadingCityState extends CityState {
  const LoadingCityState();
}

class DataCityState extends CityState {
  final List<CityEntity> cities;

  DataCityState({required this.cities});
}

class ErrorCityState extends CityState {
  final String message;

  ErrorCityState({required this.message});
}
