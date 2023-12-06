import '../entities/entities.dart';

abstract class SearchCityUseCase{
   Future<List<CityEntity>> call({required String input});
}