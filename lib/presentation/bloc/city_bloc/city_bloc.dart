import 'package:bloc/bloc.dart';
import '../../../domain/domain.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final SearchCityUseCase searchCity;
  String _search = '';
  CityBloc({required this.searchCity}) : super(const InitialCityState()) {
    on<SearchChanged>((event, _) {
      _search = event.value;
    });

    on<SearchCleaned>((_, emit) {
      _search = '';
      emit(const InitialCityState());
    });

    on<SeachrConsuled>((_, emit) async {
      emit(const LoadingCityState());

      try {
        final response = await searchCity.call(input: _search);
        emit(DataCityState(cities: response));
      } catch (e) {
        emit(ErrorCityState(message: e.toString()));
      }
    });
  }
}
