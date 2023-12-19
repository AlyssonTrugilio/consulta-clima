part of 'weather_cubit.dart';

// @immutable
// sealed class WeatherState {
//   const WeatherState();
// }

// final class WeatherLoading extends WeatherState {
//   const WeatherLoading();
// }

// final class WeatherFailure extends WeatherState {
//   final String message;
//   const WeatherFailure({required this.message});
// }

// final class WeatherSuccess extends WeatherState {
//   final WeatherEntity weather;
//   const WeatherSuccess({required this.weather});
// }

@freezed
class WeatherState with _$WeatherState{
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.success({
    required WeatherEntity weather,
  }) = _Success;
  const factory WeatherState.failure({required String message}) = _Failure;
  const WeatherState._();
}