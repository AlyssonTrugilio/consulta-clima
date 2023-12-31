import 'package:consultar_clima/main/factories/bloc/city_bloc_factory.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import '../bloc/city_bloc/city_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  late final CityBloc cityBloc;
  @override
  void initState() {
    cityBloc = cityBlocFactory();
    super.initState();
  }

  @override
  void dispose() {
    cityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cityBloc,
      child: SafeArea(
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
                  const SearchFieldWidget(),
                  const SizedBox(height: 25),
                  const ConsultButtonWidget(),
                  const SizedBox(height: 50),
                  CityListWidget(cityBloc: cityBloc)
                ],
              ),
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
    final cityBloc = context.read<CityBloc>();
    return BlocConsumer<CityBloc, CityState>(
      bloc: cityBloc,
      listenWhen: (previous, current) {
        return current.failureOrSuccess.isSome();
      },
      listener: (context, state) {
        final isFailure = state.failureOrSuccess.fold(
          () => true,
          (leftOrRigth) => leftOrRigth.isLeft(),
        );

        final message = state.failureOrSuccess.fold(
          () => '',
          (leftOrRigth) => leftOrRigth.fold(dartz.id, (success) => success),
        );
        final snackBar = SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: isFailure ? Colors.red[400] : Colors.green[400],
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 15,
          ),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Fechar',
            backgroundColor: Colors.black,
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      buildWhen: (previous, current) {
        return (previous.isLoading != current.isLoading) ||
            (previous.cities != current.cities);
      },
      builder: (context, state) {
        if (state.cities.isNotEmpty) {
          return Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: state.cities.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 5);
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/weather-detail',
                        arguments: state.cities[index],
                      );
                    },
                    tileColor: Theme.of(context).cardColor,
                    title: Text(
                      '${state.cities[index].name} - ${state.cities[index].state}',
                    ),
                  );
                },
              ),
            ),
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
            cityBloc.add(const CityEvent.seachrConsulted());
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
    final cityBloc = context.read<CityBloc>();

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
            cityBloc.add(CityEvent.searchChanged(value: value));
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Digite uma cidade",
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              tooltip: "Limpar consulta",
              onPressed: () {
                cityBloc.add(const CityEvent.searchCleaned());
              },
            ),
          ),
        );
      },
    );
  }
}
