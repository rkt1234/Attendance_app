import 'package:flutter/material.dart';

import 'database.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String attendance = "Unanswered";
  String response = "";
  Database ob = Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(
                  image: NetworkImage(
                      "http://www.dpsjhakri.com/images/dps_logo1.png"),
                  width: 80,
                  height: 80,
                ),
                const Text(
                  "Hey there, mark your attendance below for the day!",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Attendance status :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      attendance,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            attendance = "Present";
                          });
                        },
                        child: const Text("Present")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            attendance = "Absent";
                          });
                        },
                        child: const Text("Absent"))
                  ],
                ),
                const Text(
                  "Click on submit to record your response and log out",
                  style: TextStyle(color: Colors.red),
                ),
                ElevatedButton(
                    onPressed: () async {
                      ob.create(attendance);
                      setState(() {
                        response = "Your response has been recorded";
                      });

                      Future.delayed(const Duration(milliseconds: 400), () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      });
                    },
                    child: const Text("Submit")),
                Text(
                  response,
                  style: const TextStyle(
                      color: Colors.green, fontStyle: FontStyle.normal),
                ),
              ]),
        ),
      ),
    );
  }
}
