import 'package:weather_app/domain/contracts/weather_repository_base.dart';
import 'package:weather_app/domain/entities/weather.dart';

class FetchWeatherDetails {
  final WeatherRepositoryBase weatherRepository;

  FetchWeatherDetails(this.weatherRepository);

  Future<Weather> execute(city) async {
    return await weatherRepository.fetchWeather(city);
  }
}
