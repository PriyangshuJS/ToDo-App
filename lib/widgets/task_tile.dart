import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/overview.dart';

import '../resources/firestore_methord.dart';

class TaskTile extends StatefulWidget {
  final dynamic snap;
  const TaskTile({super.key, required this.snap});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool complete = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 1, bottom: 1),
          height: MediaQuery.of(context).size.height / 12,
          width: double.infinity,
          child: ListTile(
            leading: InkWell(
              onTap: () {
                setState(() {
                  complete = true;
                  FirestoreMethord().updateStatus(
                      widget.snap["catagory"], widget.snap["docId"], complete);
                });
              },
              onDoubleTap: () {
                setState(() {
                  complete = false;
                  FirestoreMethord().updateStatus(
                      widget.snap["catagory"], widget.snap["docId"], complete);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 167, 165, 165)),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 30,
                width: 30,
                child: complete ? const Icon(Icons.check) : null,
              ),
            ),
            title: Text(
              widget.snap["title"],
              style: const TextStyle(fontSize: 15),
            ),
            subtitle: Text(widget.snap["dueDate"]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Confirmation'),
                      content: const Text('Are you sure you want to delete?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Delete'),
                          onPressed: () {
                            FirestoreMethord().deleteTask(
                                widget.snap["catagory"], widget.snap["docId"]);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 5, horizontal: MediaQuery.of(context).size.width / 5),
          child: const Divider(
              height: 1, color: Color.fromARGB(255, 201, 198, 198)),
        )
      ],
    );
  }
}
