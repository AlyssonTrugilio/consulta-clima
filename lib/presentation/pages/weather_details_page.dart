import 'package:consultar_clima/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main/factories/factories.dart';
import '../bloc/bloc.dart';

class WeatherDatailPage extends StatefulWidget {
  final CityEntity city;

  const WeatherDatailPage({
    super.key,
    required this.city,
  });

  @override
  State<WeatherDatailPage> createState() => _WeatherDatailPageState();
}

class _WeatherDatailPageState extends State<WeatherDatailPage> {
  late final WeatherCubit cubit;

  @override
  void initState() {
    cubit = weatherCubitFactory();
    cubit.initial(
        cityName: widget.city.name,
        stateName: widget.city.state,
        countryName: widget.city.country,
        latitude: widget.city.latitude,
        longitude: widget.city.longitude);
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quinta do sol - Paraná"),
          centerTitle: true,
        ),
        body: Center(
          child: Center(
            child: RichText(
              text: TextSpan(
                  text: '32',
                  style: textTheme.displayLarge,
                  children: [TextSpan(text: 'ºC', style: textTheme.bodyLarge)]),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
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
                            TemperatureDetailWidget(title: 'Minima', value: 20),
                            TemperatureDetailWidget(
                                title: 'Humidade', value: 20)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TemperatureDetailWidget(title: 'Minima', value: 20),
                            TemperatureDetailWidget(
                                title: 'Humidade', value: 20)
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.keyboard_arrow_up),
        ),
        bottomNavigationBar: const BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TemperatureDetailWidget(
                title: 'Sensação',
                value: 32,
              ),
              TemperatureDetailWidget(title: 'Máxima', value: 34),
              TemperatureDetailWidget(title: 'Mínima', value: 35)
            ],
          ),
        ),
      ),
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
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text.rich(
            TextSpan(
              text: value.toStringAsFixed(0),
              children: [TextSpan(text: type, style: textTheme.bodySmall)],
            ),
            style: textTheme.bodyMedium)
      ],
    );
  }
}