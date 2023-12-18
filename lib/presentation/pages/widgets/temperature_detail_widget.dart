import 'package:consultar_clima/presentation/pages/widgets/value_type_enum.dart';
import 'package:consultar_clima/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemperatureDetailWidget extends StatelessWidget {
  final ValueType valueType;

  const TemperatureDetailWidget({
    super.key,
    required this.valueType,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          double currentValue = 0.0;
          currentValue = switch (valueType) {
            ValueType.minTemperature => state.weather.minTemperature,
            ValueType.maxTemperature => state.weather.maxTemperature,
            ValueType.thermalSensation => state.weather.thermalSensation,
            ValueType.humidity => state.weather.humidity,
            ValueType.currentTemp => state.weather.temperature,
          };

          if (valueType == ValueType.currentTemp) {
            return RichText(
              text: TextSpan(
                text: currentValue.toStringAsFixed(0),
                style: textTheme.displayLarge,
                children: [
                  TextSpan(text: valueType.type, style: textTheme.bodyLarge),
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
        if (state is WeatherLoading) {
          return const CircularProgressIndicator();
        }
        return const SizedBox.shrink();
      },
    );
  }
}