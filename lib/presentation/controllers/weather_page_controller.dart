import 'package:flutter/material.dart';
import 'package:weather_app/application/use_cases/fetch_current_weather.dart';
import 'package:weather_app/application/use_cases/get_user_location.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherPageController extends ChangeNotifier {
  final FetchCurrentWeather fetchCurrentWeather;
  final GetUserLocation getUserLocation;
  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;
  String? _city;

  WeatherPageController(this.fetchCurrentWeather, this.getUserLocation);

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadWeather() async {
    _isLoading = true;
    notifyListeners();

    try {
      _city = await getUserLocation.execute();
      _weather = await fetchCurrentWeather.execute(_city!);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false; // Ensure loading state is updated in case of error
      notifyListeners();
      return;
    }
    _isLoading = false;
    notifyListeners();
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/Animation - Sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'thunderstorm':
        return 'assets/Animation - Storm.json';
      case 'drizzle':
        return 'assets/Animation - Rain.json';
      case 'rain':
        return 'assets/Animation - Rain.json';
      case 'snow':
        return 'assets/Animation - Snow.json';
      case 'clear':
        return 'assets/Animation - Sunny.json';
      case 'clouds':
        return 'assets/Animation - Cloudy.json';
      default:
        return 'assets/Animation - Sunny.json';
    }
  }
}
