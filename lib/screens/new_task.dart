import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/priority_cards.dart';

class NewTask extends StatelessWidget {
  TextEditingController taskName = TextEditingController();
  TextEditingController taskDeadline = TextEditingController();
  String priority = "";

  NewTask({super.key});
  Future<void> uploadTask() async {
    final FirebaseFirestore taskData = FirebaseFirestore.instance;
    await taskData.collection("Catagory").add({"data": 123});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Enter your \ntask details",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          const SizedBox(height: 20),
          TextField(
            onTap: () {},
            controller: taskName,
            decoration: InputDecoration(
              hintText: "Enter task",
              contentPadding: const EdgeInsets.all(8),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: taskDeadline,
            decoration: InputDecoration(
              hintText: "Enter task deadline",
              contentPadding: const EdgeInsets.all(8),
            ),
          ),
          Text("\n\nChoose Priority1!\n"),
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
                    priority = "top";
                  },
                  child: PriorityCard(pro: "H", colour: Colors.red)),
              InkWell(
                  onTap: () {
                    priority = "top";
                  },
                  child: PriorityCard(pro: "M", colour: Colors.orangeAccent)),
              InkWell(
                  onTap: () {
                    priority = "top";
                  },
                  child: PriorityCard(pro: "L", colour: Colors.green)),
            ],
          ),
          const SizedBox(height: 35),
          Align(
            alignment: Alignment.bottomRight,
            child: Card(
              child: TextButton(
                  onPressed: () => uploadTask(), child: const Text("Add")),
            ),
          )
        ],
      ),
    );
  }
}
