import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/services/weather_service.dart';

import 'blocs/weather_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => WeatherBloc(WeatherService()),
      child: const WeatherScreen(),
    ),
  ));
}
