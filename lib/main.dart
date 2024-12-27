// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{

@override

void initState(){

  FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('================================User is currently signed out!');
      } else {
        print('================================User is signed in!');
      }
    });
    super.initState();

}

Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    routes:{

      "signup":(context) => SignUp(),
      "login":(context) => Login(),
      "homepage":(context) => Homepage(),
    },
  );
}
}
