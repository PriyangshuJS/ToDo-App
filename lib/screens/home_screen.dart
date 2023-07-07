import 'package:flutter/material.dart';
import 'package:todo/screens/new_task.dart';
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
  int screen = 1;
  void newtaskAdd(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blueGrey,
      context: context,
      builder: (_) {
        return NewTask();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () => newtaskAdd(context),
          child: const Icon(Icons.add),
        ),
        backgroundColor: mobileBackgroundColor,
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: const Text(
            "Good Morning",
            // style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      width: MediaQuery.of(context).size.width *
                          0.7, // Adjust the width as needed
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                screen = 1;
                              });
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              title: Text("Today's List"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                screen = 2;
                              });
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              title: Text("ToDo List"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screen == 1
                  ? OverviewTile(
                      date: 'Today',
                      title: "Today's Tasks",
                      taskDone: 10,
                      totalTask: 12,
                      percentageDone: 82,
                    )
                  : OverviewTile(
                      date: "Day's Date",
                      title: "Task List",
                      taskDone: 50,
                      totalTask: 60,
                      percentageDone: 85),
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
