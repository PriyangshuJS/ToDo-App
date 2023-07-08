import 'package:flutter/material.dart';

class OverviewTile extends StatelessWidget {
  String date;
  String title;
  int taskDone;
  int totalTask;

  OverviewTile({
    super.key,
    required this.date,
    required this.taskDone,
    required this.title,
    required this.totalTask,
  });

  @override
  Widget build(BuildContext context) {
    int percentageDone = ((taskDone / totalTask) * 100).toInt();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black),
      height: MediaQuery.of(context).size.height / 2.8,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " $date",
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(height: 70),
            Text(
              "$taskDone/$totalTask Tasks",
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              "$percentageDone%",
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 3,
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                  ),
                  FractionallySizedBox(
                    widthFactor: taskDone / totalTask,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 3,
                          )),
                      margin: const EdgeInsets.only(top: 10),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
