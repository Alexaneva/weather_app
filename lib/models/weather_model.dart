class Weather {
  final String city;
  final int temperature;

  Weather({required this.city, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['location']['name'],
      temperature: json['current']['temp_c'],
    );
  }
}
