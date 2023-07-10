import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/resources/firestore_methord.dart';
import 'package:todo/widgets/priority_cards.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController taskNameController = TextEditingController();
  DateTime? taskDeadline;
  String priority = "";
  bool status = false;

  void datepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((datepicked) {
      if (datepicked == null) {
        return;
      }
      setState(() {
        taskDeadline = datepicked;
      });
    });
  }

  @override
  void dispose() {
    taskNameController.dispose();

    super.dispose();
  }

  void addTask() {
    if (_formKey.currentState!.validate()) {
      final DateTime deadline = taskDeadline ?? DateTime.now();
      FirestoreMethord().uploadTask(
        "Today",
        taskNameController.text,
        deadline,
        priority,
        status,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            "Enter your \ntask details",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        taskDeadline == null
                            ? "Enter Dead-Line - !"
                            : "Dead-Line - : ${DateFormat.yMd().format(taskDeadline!)}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    InkWell(
                      onTap: datepicker,
                      child: const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ],
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
                      child: PriorityCard(pro: "T", colour: Colors.deepPurple),
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
                      child: PriorityCard(pro: "L", colour: Colors.greenAccent),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
    );
  }
}
