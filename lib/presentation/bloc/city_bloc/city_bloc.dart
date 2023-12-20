import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import '../../../domain/domain.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final SearchCityUseCase searchCity;

  CityBloc({required this.searchCity}) : super(CityState.initial()) {
    on<SearchChanged>((event, emit) {
      emit(
        state.copyWith(
          searchField: event.value,
          errorMessage: '',
          isLoading: false,
        ),
      );
    });

    on<SearchCleaned>((_, emit) {
      emit(CityState.initial());
    });

    on<SeachrConsuled>((_, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      try {
        final response = await searchCity.call(input: state.searchField);
        emit(
          state.copyWith(isLoading: false, errorMessage: '', cities: response),
        );
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
