import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app_tansangle/models/weather.dart';

import 'package:weather_app_tansangle/models/weather.dart';

Future<Weather> fetchWeather() async {
  final apiKey = '42d4f5e801bbdb3381bc43eac6101205';
  final city = 'Paris';
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  } else {
    throw Exception('Failed to load weather');
  }

}