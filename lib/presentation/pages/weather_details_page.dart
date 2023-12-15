import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entities.dart';
import '../../main/factories/factories.dart';
import '../bloc/bloc.dart';

class WeatherDetailPage extends StatefulWidget {
  final CityEntity city;

  const WeatherDetailPage({
    super.key,
    required this.city,
  });

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  late final WeatherCubit cubit;

  @override
  void initState() {
    cubit = weatherCubitFactory();
    cubit.initial(
      cityName: widget.city.name,
      stateName: widget.city.state,
      countryName: widget.city.country,
      latitude: widget.city.latitude,
      longitude: widget.city.longitude,
    );
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CityNameWidget(),
        ),
        body: const Center(
          child: CurrentTempWidget(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Mais informações',
          child: const Icon(Icons.arrow_upward_outlined),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TemperatureDetailWidget(
                            title: 'Mínima',
                            value: 19,
                          ),
                          TemperatureDetailWidget(
                            title: 'Máxima',
                            value: 45,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TemperatureDetailWidget(
                            title: 'Sensação',
                            value: 49,
                          ),
                          TemperatureDetailWidget(
                            title: 'Humidade',
                            value: 80,
                            type: '%',
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: const BottomAppBar(
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TemperatureDetailWidget(
                title: 'Mínima',
                value: 19,
              ),
              TemperatureDetailWidget(
                title: 'Máxima',
                value: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentTempWidget extends StatelessWidget {
  const CurrentTempWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return RichText(
            text: TextSpan(
              text: state.weather.temperature.toStringAsFixed(0),
              style: textTheme.displayLarge,
              children: [
                TextSpan(
                  text: '°C',
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          );
        }

        if (state is WeatherLoading) {
          return const CircularProgressIndicator();
        }

        if (state is WeatherFailure) {
          return Text(state.message);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

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

class TemperatureDetailWidget extends StatelessWidget {
  final String title;
  final double value;
  final String? type;

  const TemperatureDetailWidget({
    super.key,
    required this.title,
    required this.value,
    this.type = '°C',
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          title,
          style: textTheme.bodySmall,
        ),
        Text.rich(
          TextSpan(
            text: value.toStringAsFixed(0),
            children: [
              TextSpan(
                text: type,
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