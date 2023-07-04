import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/widgets/task_tile.dart';

import '../widgets/catagory.dart';

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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              ),
              const SizedBox(height: 20),
              CatagoryTile(title: "Ongoing"),
              TaskTile(taskName: "HomeWork", date: "Today"),
              // Divider(
              //   height: MediaQuery.of(context).size.width / 2,
              //   color: Colors.grey,
              // ),
              TaskTile(taskName: "HomeWork", date: "Yesterday"),
              const SizedBox(height: 20),
              CatagoryTile(title: "Completed"),
              TaskTile(taskName: "Sleep", date: DateTime.now().toString()),
            ],
          ),
        ));
  }
}
