import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app_tansangle/models/weather.dart';

Future<Weather> fetchWeather(String cityName, String unit) async {
  final apiKey = '42d4f5e801bbdb3381bc43eac6101205';
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=$unit');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  } else {
    throw Exception('Failed to load weather');
  }

}