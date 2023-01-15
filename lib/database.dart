import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Database {
  Future<void> create(attendance) async {
    print("initialize ho rha hai ");
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    await users.add({
      "time": currentTime,
      "date ": formattedDate,
      "attendance status ": attendance,
    });
  }
}
