import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class CitySelectorScreen extends StatefulWidget {
  const CitySelectorScreen({super.key});

  @override
  State<CitySelectorScreen> createState() => _CitySelectorScreenState();
}

class _CitySelectorScreenState extends State<CitySelectorScreen> {
  String cityName = '';
  Future<List<String>> _citiesFuture = Future.value([]);

  @override
  void initState() {
    super.initState();
    _citiesFuture = loadAsset().then((value) => value.split('\n'));
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/city_list.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Selector'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter city name',
              ),
              onChanged: (value) {
                setState(() {
                  cityName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: const Text('Search'),
            ),
            Expanded(
                child: FutureBuilder<List<String>>(
              future: _citiesFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final cities = snapshot.data
                      ?.where((item) =>
                          item.toLowerCase().contains(cityName.toLowerCase()))
                      .toList();
                  return ListView.builder(
                    itemCount: cities?.length,
                    itemBuilder: (context, index) {
                      final city = cities![index];
                      return ListTile(
                        title: Text(city),
                        onTap: () {
                          Navigator.pop(context, city);
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            )),
          ],
        ),
      ),
    );
  }
}
