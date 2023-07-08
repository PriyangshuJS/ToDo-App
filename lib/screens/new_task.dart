import 'package:flutter/material.dart';
import 'package:todo/resources/firestore_methord.dart';
import 'package:todo/widgets/priority_cards.dart';

class NewTask extends StatefulWidget {
  NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDeadlineController = TextEditingController();

  String priority = "";
  bool status = false;

  @override
  void dispose() {
    taskNameController.dispose();
    taskDeadlineController.dispose();
    super.dispose();
  }

  void addTask() {
    if (_formKey.currentState!.validate()) {
      FirestoreMethord().uploadTask(
        "Today",
        taskNameController.text,
        taskDeadlineController.text,
        priority,
        status,
      );
      Navigator.pop(context);
    }
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
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: taskNameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter task',
                      contentPadding: EdgeInsets.all(8),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a task';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: taskDeadlineController,
                    decoration: const InputDecoration(
                      hintText: 'Enter task deadline',
                      contentPadding: EdgeInsets.all(8),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a task deadline';
                      }
                      return null;
                    },
                  ),
                  const Text(
                    "\n\nChoose Priority!\n",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          priority = "top";
                        },
                        child:
                            PriorityCard(pro: "T", colour: Colors.deepPurple),
                      ),
                      InkWell(
                        onTap: () {
                          priority = "High";
                        },
                        child: PriorityCard(pro: "H", colour: Colors.red),
                      ),
                      InkWell(
                        onTap: () {
                          priority = "Medium";
                        },
                        child: PriorityCard(pro: "M", colour: Colors.green),
                      ),
                      InkWell(
                        onTap: () {
                          priority = "Low";
                        },
                        child:
                            PriorityCard(pro: "L", colour: Colors.greenAccent),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Card(
                      child: TextButton(
                        onPressed: addTask,
                        child: const Text("Add"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
