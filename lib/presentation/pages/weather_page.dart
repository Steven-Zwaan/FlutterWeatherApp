import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/controllers/weather_page_controller.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    GetIt.instance<WeatherPageController>().loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: ChangeNotifierProvider<WeatherPageController>(
          create: (_) => GetIt.instance<WeatherPageController>(),
          child: Consumer<WeatherPageController>(
            builder: (context, controller, child) {
              if (controller.isLoading) {
                return const CircularProgressIndicator();
              } else if (controller.errorMessage != null) {
                return Text('Error: ${controller.errorMessage}');
              } else if (controller.weather != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // city
                    Text(controller.weather!.cityName),

                    // icon
                    Lottie.asset(controller.getWeatherAnimation(
                        controller.weather!.mainCondition)),

                    // temperature
                    Text('${controller.weather!.temperature}°C'),

                    // condition
                    Text(controller.weather!.mainCondition),
                  ],
                );
              } else {
                return Text('No weather data available');
              }
            },
          ),
        ),
      ),
    );
  }
}
