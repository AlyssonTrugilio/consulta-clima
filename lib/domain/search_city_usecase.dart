import 'package:consultar_clima/domain/city_entity.dart';

abstract class SearchCityUseCase{
   Future<List<CityEntity>> call({required String input});
}