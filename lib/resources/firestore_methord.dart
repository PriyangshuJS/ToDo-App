import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/task_info.dart';

class FirestoreMethord {
  final FirebaseFirestore taskData = FirebaseFirestore.instance;
  Future<void> uploadTask(
    String catagory,
    String title,
    DateTime dueDate,
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

      DocumentReference docRef =
          await taskData.collection(catagory).add(post.toJson());

      await docRef.update({'docId': docRef.id});
    } catch (err) {
      //Error
    }
  }

  Future<void> updateStatus(
      String catagory, String docId, bool newStatus) async {
    try {
      await taskData
          .collection(catagory)
          .doc(docId)
          .update({'status': newStatus});
    } catch (err) {
      //error
    }
  }

  Future<void> deleteTask(String catagory, String docId) async {
    try {
      await taskData.collection(catagory).doc(docId).delete();
    } catch (err) {
      //error
    }
  }

  Future<int> completeTaskCount(String category) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await taskData
          .collection(category)
          .where('status', isEqualTo: true)
          .get();

      return snapshot.size;
    } catch (err) {
      // Handle the error
      return 0;
    }
  }
}
