import 'attendancepage.dart';
import 'auth.dart';
import 'constant.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Authorization ob = new Authorization();
  String mail = "";
  String pass = "";
  final c1 = TextEditingController();
  final c2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome to the Attendance app"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 50,
              color: Colors.blueGrey,
              child: Row(children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://www.dpsjhakri.com/images/dps_logo1.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Delhi Public School",
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: textInputDecoration.copyWith(
                  hintText: "Enter your email here"),
              controller: c1,
              onChanged: (val) {
                setState(() {
                  mail = val;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: textInputDecoration.copyWith(
                  hintText: "Enter your password here"),
              controller: c2,
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  pass = val;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool res = await ob.login(mail, pass);

                  if (res == true)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AttendancePage()),
                    );
                },
                child: const Text("Sign in")),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
