import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '8cc3422845d34eeda5d134409241511';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
