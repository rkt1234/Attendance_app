import 'package:attendance_app/attendancepage.dart';
import 'package:attendance_app/signinpage.dart';
import 'constant.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Authorization ob = new Authorization();
  @override
  String mail = "";
  String pass = "";
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 50,
          color: Colors.blueGrey,
          child: Row(children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage("http://www.dpsjhakri.com/images/dps_logo1.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Delhi Public School",
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            )
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          decoration:
              textInputDecoration.copyWith(hintText: "Enter your email here"),
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
              bool res = await ob.register(mail, pass);
              if (res == true) 
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Signin()),
              );
            },
            child: const Text("Sign up")),
        SizedBox(
          height: 10,
        ),
        Text("Already an account holder?"),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signin()),
              );
            },
            child: Text("Sign in")),
      ],
    ));
  }
}
