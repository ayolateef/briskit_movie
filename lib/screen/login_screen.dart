// ignore_for_file: use_build_context_synchronously

import 'package:briskit_test/screen/movie_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'next_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //login function
  static Future<User?> loginUsingEmailPassword(
      {
        required String email,
      required String password,
      required BuildContext context
      }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("email and password not found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // create textfield controller
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 50.0),
                child: const CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 80.0,
                  child: Text(
                    'LOGO APP',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: "USERNAME"),
                ),
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "PASSWORD"),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(220, 0, 0, 30),
                  child: const Text('FORGET PASSWORD')),
              InkWell(
                onTap: () async {
                  User? user = await loginUsingEmailPassword(
                      email: _usernameController.text,
                      password: _passwordController.text,
                      context: context);
                            print(user);
                  if(user != null){
Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) => const MovieList()));

                  }
                  
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 5.0, 0.0, 5.0),
                  margin: const EdgeInsets.fromLTRB(100, 20, 100, 40),
                  height: 35.0,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
