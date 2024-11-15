import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_event.dart';
import 'package:weather_app/blocs/weather_state.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final data = await weatherService.fetchWeather(event.city);
      final temperature = data['current']['temp_c'];
      emit(WeatherLoaded(event.city, temperature));
    } catch (e) {
      emit(WeatherError('Failed to fetch weather data'));
    }
  }
}
