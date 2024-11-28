import 'package:weather_app/data/data_source/remote/weather_remote_data_source.dart';
import 'package:weather_app/domain/contracts/weather_repository_base.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherRepository extends WeatherRepositoryBase {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepository({required this.remoteDataSource});

  @override
  Future<Weather> fetchWeather(city) async {
    final weatherDTO = await remoteDataSource.fetchCurrentWeather(city);
    return weatherDTO.toDomain();
  }

  @override
  Future<String> getUserLocation() async {
    return await remoteDataSource.getUserLocation();
  }
}
