import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  late WeatherEntity weather;
  final SearchWeatherUseCase searchWeather;
  WeatherCubit({required this.searchWeather})
      : super(const WeatherState.loading());
  Future<void> initial({
    required String cityName,
    required String stateName,
    required String countryName,
    required double latitude,
    required double longitude,
  }) async {
    emit(const WeatherState.loading());

    try {
      final response = await searchWeather(
        city: cityName,
        state: stateName,
        country: countryName,
        latitude: latitude,
        longitude: longitude,
      );
      weather = response;
      emit(WeatherState.success(weather: response));
    } catch (e) {
      emit(WeatherState.failure(message: e.toString()));
    }
  }

  Future<void> refreshData() async {
    await initial(
        cityName: weather.city.name,
        stateName: weather.city.state,
        countryName: weather.city.country,
        latitude: weather.city.latitude,
        longitude: weather.city.longitude);
  }

  void newConsult() {}

  Future<void> screenshotShare() async {}
}
