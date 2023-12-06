import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../ropositories/respositories.dart';

SearchWeatherUseCase searchWeatherUseCaseFactory() {
  return SearchWeatherUseCaseImpl(
    repository: weatherRepositoryFactory(),
  );
}
