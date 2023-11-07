import 'package:http/http.dart' as http;
import 'dart:convert';

Future<ApiClima> buscarApiClima(String latitude, String longitude) async {
  final urlClima = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=c93ec169bc7918636f32dc40e73d73d8&units=metric');

  final responseClima = await http.get(urlClima);
  if (responseClima.statusCode == 200) {
    final data = json.decode(responseClima.body);
    return ApiClima.fromJson(data);
  } else {
    throw Exception('Falha ao buscar dados de clima');
  }
}

class ApiClima {
  String? description;
  double? temp;
  double? tempMin;
  double? tempMax;
  int? humidity;

  ApiClima({this.temp, this.tempMin, this.tempMax, this.humidity});
  ApiClima copyWith({temp, tempMin, tempMax, humidity}) {
    return ApiClima(
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMin,
      humidity: humidity ?? this.humidity,
    );
  }

  atuaDadosClima(ApiClima newApiClima) {
    temp = newApiClima.temp;
    tempMin = newApiClima.tempMin;
    tempMax = newApiClima.tempMax;
    humidity = newApiClima.humidity;
  }

  ApiClima.fromJson(dynamic json) {
    var weatherTemp = json["weather"][0];
    description = weatherTemp["description"];
    var mainTemp = json['main'];
    temp = mainTemp['temp'];
    tempMin = mainTemp['temp_min'];
    tempMax = mainTemp['temp_max'];
    humidity = mainTemp['humidity'];
  }

  @override
  toString() {
    return 'Temperatura: $temp, Temp. minima: $tempMin, Temp. maxima: $tempMax, Humidade: $humidity", Descrição: $description';
  }
}
