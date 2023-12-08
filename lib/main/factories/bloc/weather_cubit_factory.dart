import 'package:consultar_clima/main/factories/usecases/usecase.dart';
import 'package:consultar_clima/presentation/bloc/city_bloc/weather_cubit/weather_cubit.dart';

WeatherCubit weatherCubitFactory() {
  return WeatherCubit(
    searchWeather: searchWeatherUseCaseFactory(),
  );
}
