/*import 'package:consultar_clima/model/apiCidade.dart';
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
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: buscarApiCidade(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ListTile(
                  title: Text(''),
                );
              });
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Erro ao pesquisar a cidade'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
*/