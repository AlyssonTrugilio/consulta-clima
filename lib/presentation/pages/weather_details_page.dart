import 'package:consultar_clima/presentation/pages/widgets/temperature_detail_widget.dart';
import 'package:consultar_clima/presentation/pages/widgets/value_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entities.dart';
import '../../main/factories/factories.dart';
import '../bloc/bloc.dart';
import 'widgets/city_name_widgets.dart';

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
          child: TemperatureDetailWidget(valueType: ValueType.currentTemp),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Mais informações',
          child: const Icon(Icons.arrow_upward_outlined),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: cubit,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TemperatureDetailWidget(
                                valueType: ValueType.minTemperature),
                            TemperatureDetailWidget(
                                valueType: ValueType.maxTemperature),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TemperatureDetailWidget(
                                valueType: ValueType.thermalSensation),
                            TemperatureDetailWidget(
                                valueType: ValueType.humidity)
                          ],
                        ),
                      ],
                    ),
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
              TemperatureDetailWidget(valueType: ValueType.minTemperature),
              TemperatureDetailWidget(valueType: ValueType.maxTemperature)
            ],
          ),
        ),
      ),
    );
  }
}
