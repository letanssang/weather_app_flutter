import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DetailCard(BuildContext context, String title, String number,
    String unit) {
  return Card(
    margin: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('$title',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$number $unit',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ],
            ),
          ],
        ),
      ),
    );
}