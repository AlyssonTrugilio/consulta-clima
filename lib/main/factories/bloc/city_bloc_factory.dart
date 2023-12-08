import '../../../presentation/bloc/bloc.dart';
import '../usecases/usecase.dart';

CityBloc cityBlocFactory() {
  return CityBloc(searchCity: searchCityUseCaseFactory());
}
