import 'package:flutter/material.dart';

Widget detailCard(BuildContext context, String title, num number, String unit) {
  return Card(
    margin: const EdgeInsets.all(5),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$number $unit',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
