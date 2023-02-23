import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/detail_card.dart';
import 'package:weather_app_tansangle/services/weather_api.dart';
import 'package:weather_app_tansangle/models/weather.dart';

class HomeScreen extends StatefulWidget {
  Weather weather;

  HomeScreen({super.key,
  required this.weather});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.weather.cityName,
                  style: TextStyle(
                    fontSize: 40,
                  )),
              Text(DateFormat('EEEE h:mm a').format(widget.weather.dateTime),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.sunny,
                size: 100,
                color: Colors.orange,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.weather.temperature}',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('\u00b0C',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),)
                ],
              ),
              Text(widget.weather.weatherState,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Table(
                children: [
                  TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                            child: DetailCard(context, 'Feel Like:', widget.weather.feelLike.toString(), '\u00b0C')
                        ),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: DetailCard(context, 'Humidity:', widget.weather.humidity.toString(), '%')
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: DetailCard(context, 'Pressure:', widget.weather.pressure.toString(), 'hPa')
                        ),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: DetailCard(context, 'Wind Speed:', widget.weather.windSpeed.toString(), 'km/h')
                        ),
                      ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
