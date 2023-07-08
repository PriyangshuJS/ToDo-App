import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/task_info.dart';

class FirestoreMethord {
  final FirebaseFirestore taskData = FirebaseFirestore.instance;
  Future<void> uploadTask(
    String catagory,
    String title,
    String dueDate,
    String priority,
    bool status,
  ) async {
    try {
      Post post = Post(
        catagory: catagory,
        title: title,
        dueDate: dueDate,
        priority: priority,
        status: status,
      );
      await taskData.collection(catagory).add(post.toJson());
    } catch (err) {
      //Error
    }
  }
}
