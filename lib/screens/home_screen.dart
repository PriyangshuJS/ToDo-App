import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/widgets/task_tile.dart';

import '../widgets/catagory.dart';
import '../widgets/overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mobileBackgroundColor,
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Text(
            "Hi Usename",
            // style: TextStyle(color: Colors.black),
          ),
          actions: const [
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/11/10/05/48/user-2935527_1280.png"),
                  radius: 20,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverviewTile(
                date: 'Today',
                title: "Today's Tasks",
                taskDone: 10,
                totalTask: 12,
                percentageDone: 82,
              ),
              const SizedBox(height: 20),
              CatagoryTile(title: "Ongoing", taskNo: 5),
              TaskTile(taskName: "HomeWork", date: "Today"),
              TaskTile(taskName: "HomeWork", date: "Yesterday"),
              const SizedBox(height: 20),
              CatagoryTile(title: "Completed", taskNo: 10),
              TaskTile(taskName: "Sleep", date: DateTime.now().toString()),
            ],
          ),
        ));
  }
}
