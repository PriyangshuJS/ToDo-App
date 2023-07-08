import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/new_task.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/widgets/task_tile.dart';

import '../widgets/catagory.dart';
import '../widgets/greeting.dart';
import '../widgets/overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 1;
  bool dark = false;

  void changeScreen(int newScreen) {
    setState(() {
      screen = newScreen;
    });
  }

  catOpt(String title, int option) {
    final bool isSelected = screen == option;
    final textColor = isSelected ? Color.fromARGB(255, 0, 92, 92) : Colors.grey;
    return ListTile(
      onTap: () {
        changeScreen(option);
        Navigator.pop(context);
      },
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }

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
        backgroundColor: dark ? Colors.black : mobileBackgroundColor,
        appBar: AppBar(
          backgroundColor: dark ? Colors.black : mobileBackgroundColor,
          title: Text(
            getGreeting(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  dark = !dark;
                });
              },
              icon: const Icon(Icons.lightbulb_outline),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Choose Catagory'),
                    actions: [
                      catOpt("Today's List", 1),
                      catOpt("ToDo List", 2),
                      const SizedBox(height: 10),
                      catOpt("Cancel", -1),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Today")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasError) {
                      return const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      );
                    } else {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Icon(
                            Icons.info,
                            color: Colors.blue,
                            size: 60,
                          );

                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );

                        case ConnectionState.active:
                          return Column(
                            children: [
                              screen == 1
                                  ? OverviewTile(
                                      date: 'Today',
                                      title: "Today's Tasks",
                                      taskDone: 1,
                                      totalTask: snapshot.data!.docs.length,
                                    )
                                  : OverviewTile(
                                      date: "Day's Date",
                                      title: "Task List",
                                      taskDone: 50,
                                      totalTask: 60,
                                    ),
                              const SizedBox(height: 20),
                              CatagoryTile(
                                  title: "Ongoing",
                                  taskNo: snapshot.data!.docs.length),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return TaskTile(
                                      snap: snapshot.data!.docs[index].data());
                                },
                              ),
                            ],
                          );

                        case ConnectionState.done:
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return TaskTile(
                                    snap: snapshot.data!.docs[index].data());
                              },
                            ),
                          );
                      }
                    }
                  },
                ),
                // const SizedBox(height: 20),
                // CatagoryTile(title: "Completed", taskNo: 10),
              ],
            ),
          ),
        ));
  }
}
