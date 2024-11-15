
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String city;
  final double temperature;

  WeatherLoaded(this.city, this.temperature);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
