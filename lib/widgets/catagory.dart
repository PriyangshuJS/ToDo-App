import 'package:flutter/material.dart';

class CatagoryTile extends StatelessWidget {
  String title;
  int taskNo;
  CatagoryTile({super.key, required this.title, required this.taskNo});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 207, 205, 205),
              ),
              height: 25,
              width: 35,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(taskNo.toString()),
            )
          ],
        ));
  }
}
