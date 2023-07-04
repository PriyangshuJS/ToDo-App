import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  String taskName;
  String date;
  TaskTile({super.key, required this.taskName, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 1, bottom: 1),
      height: MediaQuery.of(context).size.height / 12,
      width: double.infinity,
      child: ListTile(
        leading: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 167, 165, 165)),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          taskName,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Text(date),
        trailing: IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
      ),
    );
  }
}
