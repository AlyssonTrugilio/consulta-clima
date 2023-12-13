import 'package:consultar_clima/main/factories/usecases/usecase.dart';

import '../../../presentation/bloc/bloc.dart';

WeatherCubit weatherCubitFactory() {
  return WeatherCubit(
    searchWeather: searchWeatherUseCaseFactory(),
  );
}
