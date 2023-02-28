import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/detail_card.dart';
import 'package:weather_app_tansangle/models/weather.dart';

class HomeScreen extends StatefulWidget {
  Weather weather;
  String unit;

  HomeScreen({super.key, required this.weather, required this.unit});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String temperatureUnit = 'C';
  String speedUnit = 'km/h';

  @override
  Widget build(BuildContext context) {
    if (widget.unit == 'metric') {
      temperatureUnit = 'C';
      speedUnit = 'm/s';
    } else if (widget.unit == 'standard') {
      temperatureUnit = 'K';
      speedUnit = 'm/s';
    } else if (widget.unit == 'imperial') {
      temperatureUnit = 'F';
      speedUnit = 'mph';
    }
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.weather.cityName,
                style: const TextStyle(
                  fontSize: 40,
                )),
            Text(
              DateFormat('EEEE h:mm a').format(widget.weather.dateTime),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.weather.temperature}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\u00b0$temperatureUnit',
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Image.network(
                'https://openweathermap.org/img/wn/${widget.weather.icon}@2x.png'),
            Text(
              widget.weather.weatherState,
              style: const TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            ),
            Table(
              children: [
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: detailCard(context, 'Feel Like:',
                          widget.weather.feelLike, '\u00b0$temperatureUnit')),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: detailCard(
                          context, 'Humidity:', widget.weather.humidity, '%')),
                ]),
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: detailCard(context, 'Pressure:',
                          widget.weather.pressure, 'hPa')),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: detailCard(context, 'Wind Speed:',
                          widget.weather.windSpeed, speedUnit)),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
