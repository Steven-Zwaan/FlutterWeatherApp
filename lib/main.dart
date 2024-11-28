import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/presentation/pages/weather_page.dart';
import 'package:weather_app/presentation/controllers/weather_page_controller.dart';
import 'package:weather_app/application/use_cases/fetch_current_weather.dart';
import 'package:weather_app/application/use_cases/get_user_location.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/data/data_source/remote/weather_remote_data_source.dart';
import 'package:weather_app/networking/services/weather_service.dart';
import 'package:weather_app/networking/http_client.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

void setupLocator() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => HttpClient());
  getIt.registerLazySingleton(() =>
      WeatherService('20d8a5df26ac335c7f686bae0ca5c2da', getIt<HttpClient>()));
  getIt.registerLazySingleton(
      () => WeatherRemoteDataSource(getIt<WeatherService>()));
  getIt.registerLazySingleton(() =>
      WeatherRepository(remoteDataSource: getIt<WeatherRemoteDataSource>()));
  getIt.registerLazySingleton(
      () => FetchCurrentWeather(getIt<WeatherRepository>()));
  getIt
      .registerLazySingleton(() => GetUserLocation(getIt<WeatherRepository>()));
  getIt.registerLazySingleton(() => WeatherPageController(
      getIt<FetchCurrentWeather>(), getIt<GetUserLocation>()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
