class Weather {
  final String cityName;
  final DateTime dateTime;
  final String weatherState;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final double feelLike;
  Weather({
    required this.cityName,
    required this.dateTime,
    required this.weatherState,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.feelLike,
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
    );
  }
}