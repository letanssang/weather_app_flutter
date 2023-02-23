class Weather {
  final String cityName;
  final DateTime dateTime;
  final String weatherState;
  final num temperature;
  final num humidity;
  final num windSpeed;
  final num pressure;
  final num feelLike;
  final String icon;
  Weather({
    required this.cityName,
    required this.dateTime,
    required this.weatherState,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.feelLike,
    required this.icon,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      weatherState: json['weather'][0]['main'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      pressure: json['main']['pressure'],
      feelLike: json['main']['feels_like'],
      icon: json['weather'][0]['icon'],
    );
  }
}