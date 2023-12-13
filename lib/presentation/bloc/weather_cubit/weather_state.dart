part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {
  const WeatherState();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherFailure extends WeatherState {
  final String message;
  const WeatherFailure({required this.message});
}

final class WeatherSuccess extends WeatherState {
  final WeatherEntity weather;
  const WeatherSuccess({required this.weather});
}
