import 'package:weather_app/networking/http_client.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherService {
  final HttpClient _httpClient;
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey, this._httpClient);

  Future<dynamic> getCurrentWeather(String city) async {
    try {
      final response = await _httpClient.get(
        baseUrl,
        queryParameters: {
          'q': city,
          'appid': apiKey,
          'units': 'metric',
        },
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    // get permission from user
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // fetch the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert the location into a list of placemark ojbects
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // extract the cityname from the first placemark
    String? cityName = placemarks[0].locality;

    return cityName ?? "";
  }
}
