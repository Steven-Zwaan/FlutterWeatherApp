import 'package:weather_app/domain/entities/weather.dart';

abstract class WeatherRepositoryBase {
  Future<Weather> fetchWeather(city);
  Future<String> getUserLocation();
}
