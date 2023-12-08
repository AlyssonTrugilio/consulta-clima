import 'package:bloc/bloc.dart';
import 'package:consultar_clima/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  late WeatherEntity weather;
  final SearchWeatherUseCase searchWeather;
  WeatherCubit({required this.searchWeather}) : super(const WeatherLoading());
  Future<void> initial({
    required String cityName,
    required String stateName,
    required String countryName,
    required double latitude,
    required double longitude,
  }) async {
    try {
      emit(const WeatherLoading());
      final response = await searchWeather(
          city: cityName,
          state: stateName,
          country: countryName,
          latitude: latitude,
          longitude: longitude);
      weather = response;
      emit(WeatherSuccess(weather: response));
    } catch (e) {
      emit(WeatherFailure(message: e.toString()));
    }
  }

  Future<void> refreshData() async {
    await initial(
        cityName: weather.city!.name,
        stateName: weather.city!.state,
        countryName: weather.city!.country,
        latitude: weather.city!.latitude,
        longitude: weather.city!.longitude);
  }

  void newConsult() {}

  Future<void> screenshotShare() async {}
}
