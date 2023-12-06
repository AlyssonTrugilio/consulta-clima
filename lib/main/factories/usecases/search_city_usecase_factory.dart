

import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../ropositories/city_repository_factory.dart';


SearchCityUseCase searchCityUseCaseFactory() {
  return SearchCityUseCaseImpl(
    repository: cityRepositoryFactory(),
  );
}
