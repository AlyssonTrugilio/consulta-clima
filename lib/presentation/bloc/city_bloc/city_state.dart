part of 'city_bloc.dart';

@freezed
class CityState with _$CityState {
  const factory CityState({
    required String searchField,
    required List<CityEntity> cities,
    required String errorMessage,
    required bool isLoading,
    required Option<Either<String, String>> failureOrSuccess,
  }) = _CityState;

  factory CityState.initial() {
    return CityState(
      searchField: '',
      cities: [],
      errorMessage: '',
      isLoading: false,
      failureOrSuccess: none(),
    );
  }
  const CityState._();
}
