import 'package:flutter/material.dart';

class PriorityCard extends StatelessWidget {
  Color colour;
  String pro;
  PriorityCard({super.key, required this.pro, required this.colour});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Card(
        color: Colors.white,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              pro,
              style: TextStyle(
                color: colour,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
