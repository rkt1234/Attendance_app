import 'package:firebase_auth/firebase_auth.dart';

class Authorization {
  String email = "";
  String password = "";
  Error ob=new Error();

  // Sign up using email password
  Future<bool> register(email, password) async {
    print("signup wala me aya hai");
    print(email);
    print(password);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Successful signup");
      return true;
    } on FirebaseAuthException catch (e) {
      
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print("Signup failed");
      return false;
    } catch (e) {
     
      print(e);
      print("Sign up failed");
      return false;
    }
  }

  //Sign in using email password

  Future<bool> login(email, password) async {
    print("login wala me aya hai ");
    print(email);
    print(password);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("successful login");
      return true;
    } on FirebaseAuthException catch (e) {
      
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print("login failed");
      return false;
    }
  }
}
