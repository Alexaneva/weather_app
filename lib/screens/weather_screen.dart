import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather_bloc.dart';
import '../blocs/weather_event.dart';
import '../blocs/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchWeather('Омск'));
    Future.delayed(const Duration(hours: 1), () {
      context.read<WeatherBloc>().add(FetchWeather('Омск'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const Center(child: Text('Введите город'));
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Температура в ${state.city}: ${state.temperature}°C'),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Введите город'),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<WeatherBloc>()
                        .add(FetchWeather(_controller.text));
                  },
                  child: const Text('Найти город'),
                ),
              ],
            );
          } else if (state is WeatherError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
