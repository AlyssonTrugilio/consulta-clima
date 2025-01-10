import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => const LinearProgressIndicator(),
          success: (success) => Text(
            success.weather.city.addressFull,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          failure: (failue) => Text(
            failue.message,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
