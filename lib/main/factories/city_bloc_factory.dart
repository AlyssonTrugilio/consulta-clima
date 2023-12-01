
import '../../presentation/bloc/city_bloc.dart';
import 'search_city_usecase_factory.dart';


CityBloc cityBlocFactory() {
  return CityBloc(searchCity: searchCityUseCaseFactory());
}
