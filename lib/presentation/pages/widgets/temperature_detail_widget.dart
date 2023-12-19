
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';
import 'widgets.dart';

class TemperatureDetailWidget extends StatelessWidget {
  final ValueType valueType;

  const TemperatureDetailWidget({
    super.key,
    required this.valueType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => const CircularProgressIndicator(),
          failure: (_) => const SizedBox.shrink(),
          success: (success) => _SuccessDetailWidget(
            valueType: valueType,
            weather: success.weather,
          ),
        );
      },
    );
  }
}

class _SuccessDetailWidget extends StatelessWidget {
  final ValueType valueType;
  final WeatherEntity weather;

  const _SuccessDetailWidget({
    required this.valueType,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double currentValue = 0.0;

    currentValue = switch (valueType) {
      ValueType.minTemperature => weather.minTemperature,
      ValueType.maxTemperature => weather.maxTemperature,
      ValueType.thermalSensation => weather.thermalSensation,
      ValueType.humidity => weather.humidity,
      ValueType.currentTemp => weather.temperature,
    };

    if (valueType == ValueType.currentTemp) {
      return RichText(
        text: TextSpan(
          text: currentValue.toStringAsFixed(0),
          style: textTheme.displayLarge,
          children: [
            TextSpan(
              text: valueType.type,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Text(
          valueType.title,
          style: textTheme.bodySmall,
        ),
        Text.rich(
          TextSpan(
            text: currentValue.toStringAsFixed(0),
            children: [
              TextSpan(
                text: valueType.type,
                style: textTheme.bodySmall,
              ),
            ],
          ),
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}