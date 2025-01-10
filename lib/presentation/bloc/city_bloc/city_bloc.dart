import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import '../../../domain/domain.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final SearchCityUseCase _searchCity;

  CityBloc({
    required searchCity,
  })  : _searchCity = searchCity,
        super(CityState.initial()) {
    on<CityEvent>(_cityEventMap);
  }

  Future<void> _cityEventMap(CityEvent event, Emitter<CityState> emit) {
    return event.map(
      searchChanged: (e) async {
        emit(
          state.copyWith(
            searchField: e.value,
            failureOrSuccess: none(),
            isLoading: false,
          ),
        );
      },
      searchCleaned: (e) async {
        emit(CityState.initial());
      },
      seachrConsulted: (e) async {
        emit(state.copyWith(isLoading: true, errorMessage: ''));

        final response = await _searchCity.call(input: state.searchField);
        final newState = response.fold((failure) {
          final errorMessage = failure.map(
            notFound: (_) => 'Nenhuma cidade foi encontra',
            noCityReported: (_) => 'Favor informar uma cidade para consulta',
            noInternetAccess: (_) => 'Sem acesso a internet',
            unexpected: (_) =>
                'Ocorreu um erro inesperado. Entre contato com o suporte',
          );
          return state.copyWith(
            failureOrSuccess: some(left(errorMessage)),
          );
        }, (cities) {
          final successMessage = 'Foram encontradas ${cities.length} cidades';

          return state.copyWith(
              cities: cities, failureOrSuccess: some(right(successMessage)));
        });
        emit(newState.copyWith(isLoading: false));
      },
    );
  }
}
