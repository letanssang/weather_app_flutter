import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'services/weather_api.dart';
import 'models/weather.dart';
import 'screens/setting_screen.dart';
import 'screens/city_selector_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }
}
class _MyAppState extends State<MyApp> {
  static ThemeMode themeMode = ThemeMode.system;
  void changeTheme (ThemeMode newThemeMode) {
    setState(() {
      themeMode = newThemeMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: const MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  String cityName = 'Hanoi';
  String unit = 'metric';
  void navigateToCitySelectorScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CitySelectorScreen()),
    );

    if (result != '' && result != null) {
      setState(() {
        cityName = result;
      });
    }
  }
  void navigateToSettingScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingScreen()),
    );

    if (result != null) {
      setState(() {
        unit = result;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: navigateToCitySelectorScreen,
            icon: const Icon(Icons.location_city),
          ),
          IconButton(
              onPressed: navigateToSettingScreen,
              icon: const Icon(Icons.settings)
          ),
        ],
      ),
      body: FutureBuilder<Weather>(
        future: fetchWeather(cityName, unit),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(weather: snapshot.data!, unit: unit);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
