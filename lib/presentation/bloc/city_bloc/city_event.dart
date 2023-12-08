part of 'city_bloc.dart';

abstract interface class CityEvent {
  const CityEvent();
}

class SearchChanged extends CityEvent {
  final String value;

  SearchChanged({required this.value});
}

class SearchCleaned extends CityEvent {
  const SearchCleaned();
}

class SeachrConsuled extends CityEvent {
  const SeachrConsuled();
}
