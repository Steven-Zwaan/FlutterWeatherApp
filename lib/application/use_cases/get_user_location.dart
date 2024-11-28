import 'package:weather_app/domain/contracts/weather_repository.dart';

class GetUserLocation {
  final WeatherRepository weatherRepository;

  GetUserLocation(this.weatherRepository);

  Future<String> execute() async {
    return await weatherRepository.getUserLocation();
  }
}
