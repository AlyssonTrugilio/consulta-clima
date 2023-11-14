import 'package:consultar_clima/model/apiCidade.dart';
import 'package:flutter/material.dart';

class PesquisaPage extends SearchDelegate {
  Function(ApiCidade apiCidade) apiCidadeSelecionada;

  PesquisaPage(this.apiCidadeSelecionada);

  @override
  String get searchFieldLabel => 'Digite a cidade';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder<List>(
      future: buscarApiCidade(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final apiDaCidade = snapshot.data as List<ApiCidade>;
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(apiDaCidade[index].name.toString()),
                  subtitle: Text(apiDaCidade[index].state.toString()),
                  onTap: () {
                    apiCidadeSelecionada(apiDaCidade[index]);
                    close(context, '');
                  },
                );
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao pesquisar a cidade'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
