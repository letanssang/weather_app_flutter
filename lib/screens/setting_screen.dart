import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  String? unit;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              const ListTile(
                title: Text('About'),
              )
            ],
          ),
        ),
      ),
    );
  }
}