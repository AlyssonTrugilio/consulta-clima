import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return switch (state) {
          WeatherLoading() => const LinearProgressIndicator(),
          WeatherSuccess(:final weather) => Text(weather.city!.addressFull),
          WeatherFailure(:final message) => Text(message),
        };
      },
    );
  }
}