import 'package:flutter/material.dart';
import 'package:weather_app_tansangle/main.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? unit;
  bool darkModeEnabled = false;

  void _toggleDarkMode(value) {
    if (value) {
      MyApp.of(context).changeTheme(ThemeMode.dark);
    } else {
      MyApp.of(context).changeTheme(ThemeMode.light);
    }
    darkModeEnabled = value;
  }

  void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About'),
          content: const Text('This app was created by Tan Sang Le.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, unit);
          },
        ),
        title: const Text('Setting'),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Unit'),
              trailing: DropdownButton(
                value: unit,
                items: const [
                  DropdownMenuItem(
                    value: 'metric',
                    child: Text('Metric'),
                  ),
                  DropdownMenuItem(
                    value: 'standard',
                    child: Text('Standard'),
                  ),
                  DropdownMenuItem(
                    value: 'imperial',
                    child: Text('Imperial'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    unit = value;
                  });
                },
              ),
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: darkModeEnabled,
              onChanged: (value) {
                darkModeEnabled = !darkModeEnabled;
                setState(() {
                  _toggleDarkMode(darkModeEnabled);
                });
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: (){
                showAboutDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
