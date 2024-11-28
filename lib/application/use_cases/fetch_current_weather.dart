import 'package:weather_app/domain/contracts/weather_repository.dart';
import 'package:weather_app/domain/entities/weather.dart';

class FetchCurrentWeather {
  final WeatherRepository weatherRepository;

  FetchCurrentWeather(this.weatherRepository);

  Future<Weather> execute(city) async {
    return await weatherRepository.fetchWeather(city);
  }
}
