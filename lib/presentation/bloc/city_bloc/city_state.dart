part of 'city_bloc.dart';

@freezed

class CityState with _$CityState {
  const factory CityState({
    required String searchField,
    required List<CityEntity> cities,
    required String errorMessage,
    required bool isLoading,
  }) = _CityState;

  factory CityState.initial() {
    return const CityState(
      searchField: '',
      cities: [],
      errorMessage: '',
      isLoading: false,
    );
  }
  const CityState._();
}
