import 'package:flutter/material.dart';
import 'package:todo/resources/firestore_methord.dart';
import 'package:todo/widgets/priority_cards.dart';

class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController taskNameController = TextEditingController();

  final TextEditingController taskDeadlineController = TextEditingController();

  String priority = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    taskNameController.dispose();
    taskDeadlineController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Enter your \ntask details",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: taskNameController,
            decoration: const InputDecoration(
              hintText: "Enter task",
              contentPadding: EdgeInsets.all(8),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: taskDeadlineController,
            decoration: const InputDecoration(
              hintText: "Enter task deadline",
              contentPadding: EdgeInsets.all(8),
            ),
          ),
          const Text("\n\nChoose Priority1!\n"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    priority = "top";
                  },
                  child: PriorityCard(pro: "T", colour: Colors.deepPurple)),
              InkWell(
                  onTap: () {
                    priority = "High";
                  },
                  child: PriorityCard(pro: "H", colour: Colors.red)),
              InkWell(
                  onTap: () {
                    priority = "Medium";
                  },
                  child: PriorityCard(pro: "M", colour: Colors.orangeAccent)),
              InkWell(
                  onTap: () {
                    priority = "Low";
                  },
                  child: PriorityCard(pro: "L", colour: Colors.green)),
            ],
          ),
          const SizedBox(height: 35),
          Align(
            alignment: Alignment.bottomRight,
            child: Card(
              child: TextButton(
                  onPressed: () => FirestoreMethord().uploadTask(
                        "Catagory",
                        taskNameController.text,
                        taskDeadlineController.text,
                        priority,
                      ),
                  child: const Text("Add")),
            ),
          )
        ],
      ),
    );
  }
}
