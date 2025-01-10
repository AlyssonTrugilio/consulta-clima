import 'package:dartz/dartz.dart';

import '../domain/domain.dart';

class SearchCityUseCaseImpl implements SearchCityUseCase {
  final CityRepository repository;

  const SearchCityUseCaseImpl({
    required this.repository,
  });

  @override
  SearchCityOutput call({required String input}) async {
    if (input.isEmpty) {
      return left(const CityFailure.noCityReported());
    }

    final response = await repository.searchByname(search: input);

    return response.fold(
      (failure) => left(failure),
      (cities) {
        if (cities.isEmpty) {
          return left(const CityFailure.notFound());
        }
        return right(cities);
      },
    );
  }
}
