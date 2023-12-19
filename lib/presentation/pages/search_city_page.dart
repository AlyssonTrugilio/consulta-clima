import 'package:flutter/material.dart';
import '../../main/main.dart';
import '../bloc/city_bloc/city_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  late final CityBloc cityBloc;
  late final TextEditingController searchController;

  @override
  void initState() {
    cityBloc = cityBlocFactory();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cityBloc.close();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Consultar Clima',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              BlocBuilder<CityBloc, CityState>(
                bloc: cityBloc,
                builder: (context, state) {
                  final isLoading = state == const LoadingCityState();

                  if (state is InitialCityState) {
                    searchController.text = '';
                  }

                  return TextField(
                    controller: searchController,
                    readOnly: isLoading,
                    onChanged: (value) {
                      cityBloc.add(SearchChanged(value: value));
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Digite uma cidade",
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            cityBloc.add(const SearchCleaned());
                          },
                          tooltip: "Consultar",
                        )),
                  );
                },
              ),
              const SizedBox(height: 25),
              BlocBuilder<CityBloc, CityState>(
                bloc: cityBloc,
                builder: (context, state) {
                  if (state == const LoadingCityState()) {
                    return const LinearProgressIndicator();
                  }
                  return FilledButton(
                      onPressed: () {
                        cityBloc.add(const SeachrConsuled());
                      },
                      child: const Text(('Consultar')));
                },
              ),
              const SizedBox(height: 50),
              BlocBuilder<CityBloc, CityState>(
                bloc: cityBloc,
                builder: (context, state) {
                  if (state is ErrorCityState) {
                    return Text(state.message);
                  }
                  if (state is DataCityState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.cities.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('/weather-detail',
                                arguments: state.cities[index]);
                          },
                          title: Text(state.cities[index].name),
                          subtitle: Text(state.cities[index].state),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
