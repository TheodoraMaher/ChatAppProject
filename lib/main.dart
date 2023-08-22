import 'package:chat_project/screen/Chat_page.dart';
import 'package:chat_project/screen/login.dart';
import 'package:chat_project/screen/regester.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        login.id: (context) => login(),
        Regester_page.id:(context) => Regester_page(),
        Chat_Page.id:(context) => Chat_Page(),

      },
      initialRoute: login.id,
    );
  }
}

