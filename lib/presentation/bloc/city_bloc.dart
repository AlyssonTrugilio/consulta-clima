import 'package:bloc/bloc.dart';
import 'package:http/http.dart';

import '../../domain/domain.dart';

part "city_event.dart";
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final SearchCityUseCase searchCity;
  String _search = '';
  CityBloc({required this.searchCity}) : super(const InitialityState()) {
    on<SearchChanged>((event, _) {
      _search = event.value;
    });

    on<SearchChanged>((_, emit) {
      _search = '';
      emit(const InitialityState());
    });

    on<SearchCleaned>((event, emit) async {
      emit(const LoadingCityState());
      final response = await searchCity.call(input: _search);
      emit(DataCityState(cities: response));
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
