import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<ApiCidade>> buscarApiCidade(String cidade) async {
  final url = Uri.parse(
      'https://api.openweathermap.org/geo/1.0/direct?q=$cidade&limit=5&lang=pt_br&APPID=c93ec169bc7918636f32dc40e73d73d8');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    final dataEmLista = data.toList();
    List<ApiCidade> listaDeCidades =
        data.map((cidade) => ApiCidade.fromJson(cidade)).toList();
    print('Lista: ${listaDeCidades.map((cidades) => cidades.toString())}');
    return listaDeCidades;
  } else {
    throw Exception('Falha ao buscar dados de tempo');
  }
}

class ApiCidade {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  ApiCidade({this.name, this.lat, this.lon, this.country, this.state});
  ApiCidade copyWith({name, lat, lon, country, state}) {
    return ApiCidade(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }

  atuaDadosCidade(ApiCidade newApiCidade) {
    name = newApiCidade.name;
    country = newApiCidade.country;
    lat = newApiCidade.lat;
    state = newApiCidade.state;
    lon = newApiCidade.lon;
  }

  ApiCidade.fromJson(dynamic json) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
    print("Cidade: ${name}, Estado: ${state}, Pais: ${country}");
  }

  @override
  toString() {
    return 'Nome: $name, State: $state,  Pais: $country"\n';
  }
}
