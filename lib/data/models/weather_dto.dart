import 'package:weather_app/domain/entities/weather.dart';

class WeatherDto {
  final String cityName;
  final double temperature;
  final String mainCondition;

  WeatherDto({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return WeatherDto(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'temperature': temperature,
      'mainCondition': mainCondition,
    };
  }

  factory WeatherDto.fromDomain(Weather weather) {
    return WeatherDto(
      cityName: weather.cityName,
      temperature: weather.temperature,
      mainCondition: weather.mainCondition,
    );
  }

  // Convert DTO to Domain Entity
  Weather toDomain() {
    return Weather(
      cityName: cityName,
      temperature: temperature,
      mainCondition: mainCondition,
    );
  }
}
