import 'package:flutter/material.dart';
class CitySelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, 'Paris');
          },
        ),
        title: const Text('City Selector'),
      ),
      body: Center(
        child: Text('City Selector Screen'),
      ),
    );
  }
}