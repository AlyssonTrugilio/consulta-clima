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
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cityBloc,
      child: Scaffold(
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
                SearchFieldWidget(cityBloc: cityBloc),
                const SizedBox(height: 25),
                ConsultButtonWidget(cityBloc: cityBloc),
                const SizedBox(height: 50),
                CityListWidget(cityBloc: cityBloc)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CityListWidget extends StatelessWidget {
  const CityListWidget({
    super.key,
    required this.cityBloc,
  });

  final CityBloc cityBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
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
    );
  }
}

class ConsultButtonWidget extends StatefulWidget {
  const ConsultButtonWidget({super.key});

  @override
  State<ConsultButtonWidget> createState() => _ConsultButtonWidgetState();
}

class _ConsultButtonWidgetState extends State<ConsultButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final cityBloc = context.read<CityBloc>();
    return BlocBuilder<CityBloc, CityState>(
      bloc: cityBloc,
      buildWhen: (previous, current) {
        return previous.isLoading != current.isLoading;
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const LinearProgressIndicator();
        }
        return FilledButton(
          child: const Text(('Consultar')),
          onPressed: () {
            cityBloc.add(const SeachrConsuled());
          },
        );
      },
    );
  }
}

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cityBloc = context.read<CityBloc>;

    return BlocBuilder<CityBloc, CityState>(
      bloc: cityBloc,
      buildWhen: (previous, current) {
        return (previous.isLoading != current.isLoading) ||
            current.searchField.isEmpty;
      },
      builder: (context, state) {
        if (state.searchField.isEmpty) {
          searchController.text = '';
        }

        return TextField(
          readOnly: state.isLoading,
          controller: searchController,
          onChanged: (value) {
            cityBloc.add(SearchChanged(value: value));
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Digite uma cidade",
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              tooltip: "Limpar consultaConsultar",
              onPressed: () {
                cityBloc.add(const SearchCleaned());
              },
            ),
          ),
        );
      },
    );
  }
}
