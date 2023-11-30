import 'package:consultar_clima/infra/city_dto.dart';

import '../domain/domain.dart';
import 'package:http/http.dart' as http;

class CityRepositoryImpl implements CityRepository {
  final http.Client client;
  final String apiKey;
  CityRepositoryImpl({required this.client, required this.apiKey});

  @override
  Future<List<CityEntity>> searchByname({required String search}) async {
    final url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$search&limit=5&lang=pt_br&APPID=$apiKey';
    final response = await client.get(Uri.parse(url));

    return CityDto.fromJson(response.body);
  }
}
