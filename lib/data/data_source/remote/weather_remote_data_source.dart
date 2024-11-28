import 'package:weather_app/data/models/weather_dto.dart';
import 'package:weather_app/networking/services/weather_service.dart';

class WeatherRemoteDataSource {
  final WeatherService _weatherService;

  WeatherRemoteDataSource(this._weatherService);

  Future<WeatherDto> fetchCurrentWeather(String city) async {
    try {
      final response = await _weatherService.getCurrentWeather(city);
      return WeatherDto.fromJson(response);
    } catch (e) {
      print('Error in UserRemoteDataSource.fetchUserById: $e');
      rethrow;
    }
  }

  Future<String> getUserLocation() async {
    try {
      return await _weatherService.getCurrentCity();
    } catch (e) {
      print('Error in UserRemoteDataSource.fetchUserById: $e');
      rethrow;
    }
  }
}
