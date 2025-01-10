import 'dart:convert';

import 'package:consultar_clima/infra/infra.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:consultar_clima/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class HttpMock with Mock implements http.Client {}

void main() {
  late final CityRepository sut;
  late final String apiKey;
  late final http.Client client;
  late final String url;
  late final String search;
  late final String baseUrl;
  late final String jsonRespense;

  setUpAll(() {
    apiKey = "ANY_KEY";
    search = "ANY_SEARCH";
    baseUrl = "ANY_URL";
    url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$search&limit=5&lang=pt_br&APPID=$apiKey';
    client = HttpMock();
    sut = CityRepositoryImpl(client: client, apiKey: apiKey, baseUrl: baseUrl);
    jsonRespense = jsonEncode([
      {
        "name": "Maringá",
        "lat": -23.425269,
        "lon": -51.9382078,
        "country": "BR",
        "state": "Paraná"
      },
      {
        "name": "Maringá",
        "lat": -23.2275113,
        "lon": -46.8797287,
        "country": "BR",
        "state": "São Paulo"
      },
      {
        "name": "Maringá",
        "lat": -19.7609894,
        "lon": -47.8840903,
        "country": "BR",
        "state": "Minas Gerais"
      }
    ]);
    registerFallbackValue(Uri.parse(url));
  });

  test('deve configurar todos os parametros corretamente', () async {
    when(
      () => client.get(any()),
    ).thenAnswer(
      (_) async => http.Response(jsonRespense, 200),
    );
    await sut.searchByname(search: search);

    verify(() => client.get(Uri.parse(url))).called(1);
  });

  test('deve consultar a api e trazer uma lista de cidades', () async {
    when(
      () => client.get(any()),
    ).thenAnswer(
      (_) async => http.Response(jsonRespense, 200),
    );

    final cities = await sut.searchByname(search: search);
    expect(cities.isRight(), isTrue);
  });
}
