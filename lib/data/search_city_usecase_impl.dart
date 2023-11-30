import '../domain/domain.dart';

class SearchCityUseCaseImpl implements SearchCityUseCase {
  final CityRepository repository;

  const SearchCityUseCaseImpl({
    required this.repository,
  });

  

  @override
  Future<List<CityEntity>> call({required String input}) async {
    if (input.isEmpty) {
      throw Exception('Nenhuma ciadade informada');
    }

   final cities = await repository.searchByname(search: input);

  if(cities.isEmpty){
     throw Exception('Nenhuma cidade foi encontrada');
  }

    return cities;
  }
}
