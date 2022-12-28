import 'package:briskit_test/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const IntialPage(),
    );
  }
}

class IntialPage extends StatefulWidget {
  const IntialPage({super.key});

  @override
  State<IntialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<IntialPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return const LoginScreen();
          }
          return const Center(child: CircularProgressIndicator()
          );
        }),
        
        )
      );
  }
}
