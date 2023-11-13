import 'package:consultar_clima/model/apiCidade.dart';
import 'package:flutter/material.dart';

class PesquisaPage extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Digite a cidade';
  ApiCidade apiCidade = ApiCidade();
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
        print('teste do Snapshot $snapshot');
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Teste cidade'),
                  subtitle: Text('teste de estado'),
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
