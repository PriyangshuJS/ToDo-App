import 'package:flutter/material.dart';

class CatagoryTile extends StatelessWidget {
  String title;
  CatagoryTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
