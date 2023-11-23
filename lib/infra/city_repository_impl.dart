import 'package:consultar_clima/infra/city_dto.dart';

import '../domain/domain.dart';
import 'package:http/http.dart' as http;

class CityRepositoryImpl implements CityRepository {

  final http.Client client;

  CityRepositoryImpl({required this.client});



  @override
  Future<List<CityEntity>> searchByname({required String search}) async {

    if(search.isEmpty){
      throw Exception('Nenhuma cididade informada na pesquisa');
    }

    const apiKey = 'c93ec169bc7918636f32dc40e73d73d8';
    final url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$search&limit=5&lang=pt_br&APPID=$apiKey';
    final reponse = await client.get(Uri.parse(url));

    final cities = CityDto.fromJson(reponse.body);

    if (cities.isEmpty) {
      throw Exception('Nenhuma cidade foi encontrada');
    }
    
    return cities;


  }
}
