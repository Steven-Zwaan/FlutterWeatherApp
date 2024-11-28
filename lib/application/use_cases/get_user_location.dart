import 'package:weather_app/domain/contracts/weather_repository_base.dart';

class GetUserLocation {
  final WeatherRepositoryBase weatherRepository;

  GetUserLocation(this.weatherRepository);

  Future<String> execute() async {
    return await weatherRepository.getUserLocation();
  }
}
